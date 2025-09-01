# Test local_repository with missing path (should create BAZEL_LOCAL_REPO_CONFUSION)
local_repository(
    name = "missing-local-repo",
    path = "./missing-workspace-path"
)

# Test new_local_repository with missing path (should create BAZEL_NEW_LOCAL_REPO_CONFUSION)
new_local_repository(
    name = "missing-new-repo", 
    path = "./another-missing-path",
    build_file = "BUILD"
)
