// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_background_service/flutter_background_service.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:outfit_flutter/di/injectable.dart' as _i12;
import 'package:outfit_flutter/isar_db/repositories/database_repository.dart'
    as _i4;
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart' as _i8;
import 'package:outfit_flutter/repositories/model_repository.dart' as _i6;
import 'package:outfit_flutter/utils/notification_handler.dart' as _i7;
import 'package:outfit_flutter/utils/shared_preference.dart' as _i10;
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart'
    as _i9;
import 'package:outfit_flutter/web_api/connections/work_time_connection.dart'
    as _i11;
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
    gh.lazySingleton<_i4.DatabaseRepository>(() => _i4.DatabaseRepository());
    gh.lazySingleton<_i5.FlutterBackgroundService>(
        () => injectableModule.flutterBackgroundService);
    gh.lazySingleton<_i6.ModelRepository>(() => _i6.ModelRepository());
    gh.lazySingleton<_i7.NotificationHandler>(() => _i7.NotificationHandler());
    gh.lazySingleton<_i8.OutfitBloc>(
        () => _i8.OutfitBloc(gh<_i6.ModelRepository>()));
    gh.lazySingleton<_i9.OutfitConnection>(() => _i9.OutfitConnection());
    gh.lazySingleton<_i10.SharedPreference>(() => _i10.SharedPreference());
    gh.lazySingleton<_i11.WorkTimeConnection>(() => _i11.WorkTimeConnection());
    return this;
  }
}

class _$InjectableModule extends _i12.InjectableModule {}
