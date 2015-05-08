# check subject to except checking via custom_workflows checker
# tracker = Support
# status = New
# assignee = -
if @issue.subject.present? && @issue.tracker_id == 3 && @issue.status_id == 1 && !@issue.assigned_to_id
  # assign the issue to any random Developer
  role_to_select = Role.find_by_id(4)

  users_to_select = @issue.project.users_by_role[role_to_select]

  if users_to_select.size
  # continue only if there is someone to whom we can assign the issue

    prng = Random.new
    rand_idx_inside_hash = prng.rand(users_to_select.size)
    random_user = users_to_select[rand_idx_inside_hash]

    @issue.assigned_to_id = random_user.id
  end


end
