run "validate" {
  command = apply
  module {
    source = "../examples/create-dataworks-project-with-folders"
  }
  variables {
    project_name = "tfdws_folders"
    folders = [
      "testfolder", "testfolder2"
    ]
  }
  assert {
    condition     = output.project_id != ""
    error_message = "DataWorks project creation failed"
  }
  assert {
    condition     = length(output.folder_ids) == 2
    error_message = "Should create exactly 2 folders"
  }
}
