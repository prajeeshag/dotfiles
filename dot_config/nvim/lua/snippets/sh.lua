return {
  s(
    "koisnippet",
    t {
      'source "$(dirname "$0")/koi"',
      "",
      'koiname="$0"',
      'koidescription=""',
      "",
      "__koimain() {",
      '        __addarg "-h" "--help" "help" "optional" "" "$koidescription" ""',
      '__addarg "-s" "--long" "flag|storevalue|storearray|positionalvalue|positionalarray" "required|optional" "default" "helptext" "verifyingfunction"',
      '        __parseargs "$@"',
      "",
      "        set -u",
      "",
      "}",
      "",
      '__koirun "$@"',
    }
  ),
}
