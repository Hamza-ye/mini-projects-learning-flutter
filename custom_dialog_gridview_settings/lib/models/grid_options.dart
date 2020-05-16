class GridOptions {
  int crossAxisCountPortrait;
  int crossAxisCountLandscape;
  double childAspectRatio;
  double padding;
  double spacing;

  GridOptions(this.crossAxisCountPortrait, this.crossAxisCountLandscape,
      this.childAspectRatio, this.padding, this.spacing);

  GridOptions.copyOf(GridOptions gridOptions) {
    this.crossAxisCountPortrait = gridOptions.crossAxisCountPortrait;
    this.crossAxisCountLandscape = gridOptions.crossAxisCountLandscape;
    this.childAspectRatio = gridOptions.childAspectRatio;
    this.padding = gridOptions.padding;
    this.spacing = gridOptions.spacing;
  }

  @override
  String toString() {
    return 'GridOptions{_crossAxisCountPortrait: $crossAxisCountPortrait, _crossAxisCountLandscape: $crossAxisCountLandscape, _childAspectRatio: $childAspectRatio, _padding: $padding, _spacing: $spacing}';
  }
}