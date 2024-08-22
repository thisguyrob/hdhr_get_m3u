# HDHomeRun M3U Playlist Generator

## Overview

The **HDHomeRun M3U Playlist Generator** is a lightweight Bash script designed to create M3U playlists from the channel lineup provided by an HDHomeRun tuner. This script fetches the lineup data directly from the tuner and transforms it into an M3U format that is compatible with various IPTV players and media centers.

## Features

- **Fetch Channel Lineup:** Automatically retrieves the channel lineup from your HDHomeRun tuner using its IP address.
- **M3U Playlist Creation:** Converts the channel lineup into an M3U playlist format, complete with metadata such as channel number, name, and group titles.
- **Favorites Grouping:** Channels marked as favorites on the HDHomeRun tuner are categorized under a "Favorites" group, with all other channels under an "Other" group.
- **Flexible Output:** Preview the generated M3U playlist directly in the console or save it to a specified file in UTF-8 encoding without BOM for maximum compatibility.

## Requirements

- **Bash**: A Unix-like command-line shell.
- **curl**: A tool to transfer data from or to a server, used here to download the lineup XML.
- **xsltproc**: A command-line tool for applying XSLT stylesheets to XML documents.

## Installation

To use the script, clone the repository and ensure that you have the required dependencies installed.

```bash
git clone https://github.com/yourusername/hdhomerun-m3u-generator.git
cd hdhomerun-m3u-generator
chmod +x hdhr_get_m3u.sh
```

## Usage

### Command-Line Options

- **ipaddress** (required): The IP address of your HDHomeRun tuner.
- **outfile** (optional): The path to save the generated M3U playlist. If not specified, the playlist will be printed to the console.

### Examples

1. **Generate and Save M3U Playlist:**

   ```bash
   ./hdhr_get_m3u.sh 192.168.1.1 out.m3u
   ```

   This command will connect to the HDHomeRun tuner at `192.168.1.1`, generate the M3U playlist, and save it as `out.m3u`.

2. **Preview M3U Playlist:**

   ```bash
   ./hdhr_get_m3u.sh 192.168.1.1
   ```

   This command will fetch the lineup and display the M3U playlist in the console.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue if you find a bug or have a feature request.

## Author

Created by [thisguyrob](https://github.com/thisguyrob). 

This project was inspired by the need to easily generate M3U playlists for use with HDHomeRun tuners and various IPTV applications.
