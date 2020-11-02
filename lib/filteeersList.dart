class FiltersList {
  bool isChecked;
  String titleText;

  FiltersList({this.titleText, this.isChecked});

  static List<FiltersList> filters = <FiltersList>[
    FiltersList(titleText: 'New', isChecked: false),
    FiltersList(titleText: 'Popular', isChecked: false),
    FiltersList(titleText: 'Best Price', isChecked: false),
    FiltersList(titleText: 'Best seller', isChecked: false),
  ];

  static List<FiltersList> catagories = <FiltersList>[
    FiltersList(titleText: 'Implants', isChecked: true),
    FiltersList(titleText: 'Prosthetic', isChecked: false),
    FiltersList(titleText: 'Events & Education', isChecked: false),
    FiltersList(titleText: 'Endo Sysytem', isChecked: false),
  ];
}
