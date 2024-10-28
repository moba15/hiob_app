enum IobObjectTypes {
  adapter,
  channel,
  chart,
  config,
  design,
  ioBenum,
  folder,
  group,
  host,
  info,
  instance,
  meta,
  script,
  state,
  user
}

class StateSearchFilter {
  List<IobObjectTypes>? typeFilter;
  List<String>? roleFiler;
  List<String>? roomFilter;
  List<String>? functionFilter;

  StateSearchFilter(
      {this.typeFilter, this.roleFiler, this.roomFilter, this.functionFilter});
}
