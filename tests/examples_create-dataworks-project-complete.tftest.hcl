run "setup_rds" {
  command = apply
  module {
    source = "./setup_rds"
  }
  variables {
    name = "testtf"
    password = "TestPassword!"
  }
}

run "setup_ascmuser" {
  command = apply
  module {
    source = "./setup_ascmuser"
  }
  variables {
    username = "testtf"
  }
}


run "validate" {
  command = apply
  module {
    source = "../examples/create-dataworks-project-complete"
  }
  variables {
    project_name      = "tfdws_complete"
    rds_instance_name = run.setup_rds.db_instance_id
    db_username       = run.setup_rds.username
    db_password       = "TestPassword!"
    db_name           = run.setup_rds.database
    user_ids          = [run.setup_ascmuser.user_uid]
    role_code         = "role_project_pe"
  }
  assert {
    condition     = output.project_id != ""
    error_message = "DataWorks project creation failed"
  }
  assert {
    condition     = output.project_name == "tfdws_complete"
    error_message = "Project name should match the input"
  }
  assert {
    condition     = length(output.folder_ids) == 3
    error_message = "Should create exactly 3 folders"
  }
  assert {
    condition     = output.connection_id != ""
    error_message = "Connection creation failed"
  }
}
