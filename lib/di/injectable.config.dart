// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_background_service/flutter_background_service.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:outfit_flutter/di/injectable.dart' as _i10;
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart' as _i9;
import 'package:outfit_flutter/utils/notification_handler.dart' as _i5;
import 'package:outfit_flutter/utils/shared_preference.dart' as _i7;
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart'
    as _i6;
import 'package:outfit_flutter/web_api/connections/work_time_connection.dart'
    as _i8;
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
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.ApiService>(() => _i3.ApiService());
    gh.lazySingleton<_i4.FlutterBackgroundService>(
        () => injectableModule.flutterBackgroundService);
    gh.lazySingleton<_i5.NotificationHandler>(() => _i5.NotificationHandler());
    gh.lazySingleton<_i6.OutfitConnection>(() => _i6.OutfitConnection());
    gh.lazySingleton<_i7.SharedPreference>(() => _i7.SharedPreference());
    gh.lazySingleton<_i8.WorkTimeConnection>(() => _i8.WorkTimeConnection());
    gh.lazySingleton<_i9.OutfitBloc>(
        () => _i9.OutfitBloc(gh<_i6.OutfitConnection>()));
    return this;
  }
}

class _$InjectableModule extends _i10.InjectableModule {}
