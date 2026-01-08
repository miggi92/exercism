import os

def generate_readme():
    solutions_path = "solutions"
    tracks = []

    # 1. Scan for tracks
    if os.path.exists(solutions_path):
        for track in sorted(os.listdir(solutions_path)):
            track_path = os.path.join(solutions_path, track)
            if os.path.isdir(track_path):
                # Count subdirectories (exercises)
                exercise_count = len([d for d in os.listdir(track_path) 
                                    if os.path.isdir(os.path.join(track_path, d))])
                tracks.append({
                    "name": track.upper() if track == "abap" else track.capitalize(),
                    "count": exercise_count,
                    "path": f"./solutions/{track}"
                })

    # 2. Prepare the table
    table = "| Track | Exercises | Path |\n| :--- | :--- | :--- |\n"
    for t in tracks:
        table += f"| **{t['name']}** | {t['count']} | [`{t['path']}`]({t['path']}) |\n"

    # 3. Update README safely
    try:
        with open("README.md", "r", encoding="utf-8") as f:
            content = f.read()

        start_marker = ""
        end_marker = ""

        if start_marker not in content or end_marker not in content:
            print(f"Error: Markers {start_marker} or {end_marker} not found in README.md")
            return

        # Split and rebuild
        before_part = content.split(start_marker)[0]
        after_part = content.split(end_marker)[1]
        
        new_content = f"{before_part}{start_marker}\n{table}\n{end_marker}{after_part}"

        with open("README.md", "w", encoding="utf-8") as f:
            f.write(new_content)
            
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    generate_readme()
