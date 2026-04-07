run "setup_ascmuser" {
  command = apply
  module {
    source = "./setup_ascmuser"
  }
  variables {
    username = "testtf1"
  }
}

run "validate" {
  command = apply
  module {
    source = "../examples/create-dataworks-project-with-users"
  }
  variables {
    project_name = "tfdws_users"
    user_ids     = [run.setup_ascmuser.user_uid]
    role_code    = "role_project_guest"
  }
  assert {
    condition     = output.project_id != ""
    error_message = "DataWorks project creation failed"
  }
  assert {
    condition     = output.project_name == "tfdws_users"
    error_message = "Project name should match the input"
  }
}
