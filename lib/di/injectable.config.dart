// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart' as _i8;
import 'package:outfit_flutter/services/stopwatch_service.dart' as _i6;
import 'package:outfit_flutter/utils/shared_preference.dart' as _i5;
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart'
    as _i4;
import 'package:outfit_flutter/web_api/connections/work_time_connection.dart'
    as _i7;
import 'package:outfit_flutter/web_api/services/api_service.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiService>(() => _i3.ApiService());
    gh.lazySingleton<_i4.OutfitConnection>(() => _i4.OutfitConnection());
    gh.lazySingleton<_i5.SharedPreference>(() => _i5.SharedPreference());
    gh.lazySingleton<_i6.StopwatchService>(() => _i6.StopwatchService());
    gh.lazySingleton<_i7.WorkTimeConnection>(() => _i7.WorkTimeConnection());
    gh.lazySingleton<_i8.OutfitBloc>(
        () => _i8.OutfitBloc(gh<_i4.OutfitConnection>()));
    return this;
  }
}
