import os

def generate_readme():
    solutions_path = "solutions"
    tracks = []

    # Scan the solutions directory for language tracks
    if os.path.exists(solutions_path):
        for track in sorted(os.listdir(solutions_path)):
            track_path = os.path.join(solutions_path, track)
            if os.path.isdir(track_path):
                # Count exercises (subdirectories in each track)
                exercise_count = len([d for d in os.listdir(track_path) 
                                    if os.path.isdir(os.path.join(track_path, d))])
                tracks.append({
                    "name": track.capitalize(),
                    "count": exercise_count,
                    "path": f"./solutions/{track}"
                })

    # Create the Markdown table
    table = "| Track | Exercises | Path |\n| :--- | :--- | :--- |\n"
    for t in tracks:
        table += f"| **{t['name']}** | {t['count']} | [`{t['path']}`]({t['path']}) |\n"

    # Read existing README and replace content between markers
    with open("README.md", "r") as f:
        content = f.read()

    start_marker = ""
    end_marker = ""
    
    new_content = content.split(start_marker)[0] + start_marker + "\n" + table + "\n" + end_marker + content.split(end_marker)[1]

    with open("README.md", "w") as f:
        f.write(new_content)

if __name__ == "__main__":
    generate_readme()
