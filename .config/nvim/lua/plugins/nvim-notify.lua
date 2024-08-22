return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		local last_notified_hash = nil

		local function get_current_branch(callback)
			vim.system({ "git", "rev-parse", "--abbrev-ref", "HEAD" }, { text = true }, callback)
		end

		local function get_remote_hash(branch, callback)
			vim.system({ "git", "rev-parse", "origin/" .. branch }, { text = true }, callback)
		end

		local function fetch_origin(callback)
			vim.system({ "git", "fetch", "--quiet", "origin" }, { text = true }, callback)
		end

		local function get_unpulled_commit_count(branch, callback)
			vim.system({ "git", "rev-list", "HEAD..origin/" .. branch, "--count" }, { text = true }, callback)
		end

		local function maybe_send_notification(unpulled_commits, current_branch)
			if unpulled_commits and unpulled_commits > 0 then
				notify(unpulled_commits .. " unpulled commit(s) on " .. current_branch, "info", { title = "Git" })
			end
		end

		local function check_unpulled_commits()
			get_current_branch(function(branch_result)
				local current_branch = branch_result.stdout:match("^%s*(.-)%s*$")

				get_remote_hash(current_branch, function(result)
					local current_remote_hash = result.stdout:match("^%s*(.-)%s*$")

					if last_notified_hash == current_remote_hash then
						vim.defer_fn(function()
							check_unpulled_commits()
						end, 10000)
						return
					end

					last_notified_hash = current_remote_hash

					fetch_origin(function()
						get_unpulled_commit_count(current_branch, function(rev_result)
							local unpulled_commits = tonumber(rev_result.stdout)
							maybe_send_notification(unpulled_commits, current_branch)

							vim.defer_fn(function()
								check_unpulled_commits()
							end, 10000)
						end)
					end)
				end)
			end)
		end

		fetch_origin(function()
			check_unpulled_commits()
		end)
	end,
}
