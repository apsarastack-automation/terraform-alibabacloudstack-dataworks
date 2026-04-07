run "setup_rds" {
  command = apply
  module {
    source = "./setup_rds"
  }
  variables {
    name     = "tftest"
    password = "TestPassword!"
  }
}

run "validate" {
  command = apply
  module {
    source = "../examples/create-dataworks-project-with-connection"
  }
  variables {
    project_name      = "tfdws_conn"
    rds_instance_name = run.setup_rds.db_instance_id
    db_username       = run.setup_rds.username
    db_password       = "TestPassword!"
    db_name           = run.setup_rds.database
  }
  assert {
    condition     = output.project_id != ""
    error_message = "DataWorks project creation failed"
  }
  assert {
    condition     = output.connection_id != ""
    error_message = "Connection creation failed"
  }
}
