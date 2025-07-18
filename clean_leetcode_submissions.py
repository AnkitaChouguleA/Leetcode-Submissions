import os
import glob
import re

def keep_latest_leetcode_submission(base_path):
    """
    Goes through each LeetCode problem folder, identifies all SQL and JavaScript
    submission files, and deletes all but the latest one (based on filename timestamp).
    It explicitly ignores .html, .md, and any other file types.

    Args:
        base_path (str): The root directory where your LeetCode problem folders are located.
                         e.g., "D:\\Leetcode-SQl"
    """
    if not os.path.isdir(base_path):
        print(f"Error: Base path '{base_path}' does not exist or is not a directory.")
        return

    print(f"Starting cleanup in: {base_path}")

    # Regex to extract the timestamp from filenames like "YYYY-MM-DD HH.MM.SS - ..."
    # This helps in robustly sorting files, especially if other non-standard files are present.
    timestamp_pattern = re.compile(r'(\d{4}-\d{2}-\d{2} \d{2}\.\d{2}\.\d{2})')

    problem_folders = [d for d in os.listdir(base_path) if os.path.isdir(os.path.join(base_path, d))]

    for folder_name in problem_folders:
        folder_path = os.path.join(base_path, folder_name)
        print(f"\nProcessing folder: {folder_name}")

        # Define the specific extensions for solution files that should be managed
        solution_extensions = ['*.sql', '*.js'] # Add other solution file extensions here if needed (e.g., '*.py', '*.java')

        current_submission_files = []
        for ext_pattern in solution_extensions:
            # glob.glob returns full paths
            current_submission_files.extend(glob.glob(os.path.join(folder_path, ext_pattern)))

        if not current_submission_files:
            print(f"  No SQL or JavaScript submission files found in '{folder_name}'. Skipping.")
            continue

        # Create a list of tuples: (timestamp_string, full_file_path) for sorting
        files_with_timestamps = []
        for file_path in current_submission_files:
            file_basename = os.path.basename(file_path)
            match = timestamp_pattern.match(file_basename)
            if match:
                timestamp_str = match.group(1)
                files_with_timestamps.append((timestamp_str, file_path))
            else:
                print(f"  Warning: Skipping file '{file_basename}' due to unrecognised timestamp format.")

        if not files_with_timestamps:
            print(f"  No valid timestamped SQL/JS files found to process in '{folder_name}'. Skipping.")
            continue

        # Sort based on the timestamp string (lexicographical sort works for YYYY-MM-DD HH.MM.SS)
        files_with_timestamps.sort()

        # The last element after sorting is the latest submission
        latest_submission_path = files_with_timestamps[-1][1]
        
        # All files except the latest one should be considered for deletion
        files_to_delete_paths = [item[1] for item in files_with_timestamps[:-1]]

        if not files_to_delete_paths:
            print(f"  Only one SQL/JS submission found: '{os.path.basename(latest_submission_path)}'. Nothing to delete.")
        else:
            print(f"  Keeping: '{os.path.basename(latest_submission_path)}'")
            print("  Deleting older SQL/JS submissions:")
            for file_path_to_delete in files_to_delete_paths:
                try:
                    os.remove(file_path_to_delete)
                    print(f"    - Deleted: '{os.path.basename(file_path_to_delete)}'")
                except OSError as e:
                    print(f"    - Error deleting '{os.path.basename(file_path_to_delete)}': {e}")

    print("\nCleanup complete!")

# --- Configuration ---
# Set the path to your LeetCode-SQl directory
# IMPORTANT: Use double backslashes or forward slashes for Windows paths
leetcode_sql_path = "D:\\Leetcode-SQl"

# --- Run the script ---
if __name__ == "__main__":
    keep_latest_leetcode_submission(leetcode_sql_path)