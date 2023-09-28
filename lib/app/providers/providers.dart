/// Import Libraries
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Import Implements
import 'package:listo/app/data/repository_impl/login_repository_impl/login_repository_impl.dart';
import 'package:listo/app/data/service_impl/preferences_repository_impl/preferences_repository_impl.dart';

/// Import Abstract
import 'package:listo/app/domain/repositories/login_repository/abstract_login_repository.dart';
import 'package:listo/app/domain/services/preferences_repository/abstract_preferences_repository.dart';

/// Login
final abstractLoginProvider =
    Provider<AbstractLoginRepository>((ref) => LoginRepositoryImpl());

/// Shared Preferences
final abstractPreferencesProvider = Provider<AbstractPreferencesRepository>(
    (ref) => PreferencesRepositoryImpl());
