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
import 'package:outfit_flutter/di/injectable.dart' as _i8;
import 'package:outfit_flutter/isar_db/repositories/database_repository.dart'
    as _i3;
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart' as _i6;
import 'package:outfit_flutter/repositories/model_repository.dart' as _i5;
import 'package:outfit_flutter/utils/shared_preference.dart' as _i7;

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
    gh.lazySingleton<_i3.DatabaseRepository>(() => _i3.DatabaseRepository());
    gh.lazySingleton<_i4.FlutterBackgroundService>(
        () => injectableModule.flutterBackgroundService);
    gh.lazySingleton<_i5.ModelRepository>(() => _i5.ModelRepository());
    gh.lazySingleton<_i6.OutfitBloc>(
        () => _i6.OutfitBloc(gh<_i5.ModelRepository>()));
    gh.lazySingleton<_i7.SharedPreference>(() => _i7.SharedPreference());
    return this;
  }
}

class _$InjectableModule extends _i8.InjectableModule {}
