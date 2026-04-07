run "validate" {
  command = apply
  module {
    source = "../"
  }
  variables {
    project_name   = "tfdws"
    task_auth_type = "PROJECT"
    create_folders = true
    folders = [
      "业务流程/test/folderMaxCompute/testfolder"
    ]
  }

  assert {
    condition     = output.project_id != ""
    error_message = "DataWorks project ID should not be empty."
  }

  assert {
    condition     = output.project_name == "tfdws"
    error_message = "Project name should match the input."
  }
}
