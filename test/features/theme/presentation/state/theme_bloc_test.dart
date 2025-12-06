import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stocks/features/theme/presentation/state/theme_bloc.dart';
import 'package:stocks/features/theme/presentation/state/theme_event.dart';
import 'package:stocks/features/theme/presentation/state/theme_state.dart';
import 'package:stocks/features/theme/themes.dart';

void main() {
  late ThemeBloc bloc;

  setUp(() {
    bloc = ThemeBloc();
  });

  tearDown(() {
    bloc.close();
  });

  group('ThemeBloc', () {
    test('initial state is retail bank theme', () {
      expect(bloc.state.themeMode, AppThemeMode.retailBank);
      expect(bloc.state.isRetailBank, true);
      expect(bloc.state.isNeobank, false);
    });

    group('ToggleThemeEvent', () {
      blocTest<ThemeBloc, ThemeState>(
        'toggles from retail bank to neobank',
        build: () => bloc,
        act: (bloc) => bloc.add(ToggleThemeEvent()),
        verify: (bloc) {
          expect(bloc.state.themeMode, AppThemeMode.neobank);
          expect(bloc.state.isNeobank, true);
          expect(bloc.state.isRetailBank, false);
        },
      );

      blocTest<ThemeBloc, ThemeState>(
        'toggles from neobank back to retail bank',
        build: () => bloc,
        seed: () => ThemeState(themeMode: AppThemeMode.neobank),
        act: (bloc) => bloc.add(ToggleThemeEvent()),
        verify: (bloc) {
          expect(bloc.state.themeMode, AppThemeMode.retailBank);
          expect(bloc.state.isRetailBank, true);
          expect(bloc.state.isNeobank, false);
        },
      );

      blocTest<ThemeBloc, ThemeState>(
        'multiple toggles alternate between themes',
        build: () => bloc,
        act: (bloc) {
          bloc.add(ToggleThemeEvent()); // to neobank
          bloc.add(ToggleThemeEvent()); // back to retail
          bloc.add(ToggleThemeEvent()); // to neobank again
        },
        verify: (bloc) {
          expect(bloc.state.themeMode, AppThemeMode.neobank);
          expect(bloc.state.isNeobank, true);
        },
      );
    });

    group('SetThemeEvent', () {
      blocTest<ThemeBloc, ThemeState>(
        'sets theme to neobank',
        build: () => bloc,
        act: (bloc) => bloc.add(SetThemeEvent(AppThemeMode.neobank)),
        verify: (bloc) {
          expect(bloc.state.themeMode, AppThemeMode.neobank);
        },
      );

      blocTest<ThemeBloc, ThemeState>(
        'sets theme to retail bank',
        build: () => bloc,
        seed: () => ThemeState(themeMode: AppThemeMode.neobank),
        act: (bloc) => bloc.add(SetThemeEvent(AppThemeMode.retailBank)),
        verify: (bloc) {
          expect(bloc.state.themeMode, AppThemeMode.retailBank);
        },
      );

      blocTest<ThemeBloc, ThemeState>(
        'does not emit new state when setting to current theme',
        build: () => bloc,
        act: (bloc) => bloc.add(SetThemeEvent(AppThemeMode.retailBank)),
        expect: () => [],
      );

      blocTest<ThemeBloc, ThemeState>(
        'does not emit when setting neobank while already neobank',
        build: () => bloc,
        seed: () => ThemeState(themeMode: AppThemeMode.neobank),
        act: (bloc) => bloc.add(SetThemeEvent(AppThemeMode.neobank)),
        expect: () => [],
      );
    });

    group('theme properties', () {
      test('retail bank theme has correct properties', () {
        final state = ThemeState(themeMode: AppThemeMode.retailBank);
        
        expect(state.isRetailBank, true);
        expect(state.isNeobank, false);
        expect(state.themeData, isNotNull);
      });

      test('neobank theme has correct properties', () {
        final state = ThemeState(themeMode: AppThemeMode.neobank);
        
        expect(state.isRetailBank, false);
        expect(state.isNeobank, true);
        expect(state.themeData, isNotNull);
      });

      test('retail and neobank have different theme colors', () {
        final retailState = ThemeState(themeMode: AppThemeMode.retailBank);
        final neobankState = ThemeState(themeMode: AppThemeMode.neobank);
        
        expect(retailState.positiveColor, isNot(equals(neobankState.positiveColor)));
        expect(retailState.negativeColor, isNot(equals(neobankState.negativeColor)));
      });

      test('copyWith creates new state with updated theme', () {
        final state = ThemeState(themeMode: AppThemeMode.retailBank);
        final newState = state.copyWith(themeMode: AppThemeMode.neobank);
        
        expect(newState.themeMode, AppThemeMode.neobank);
        expect(state.themeMode, AppThemeMode.retailBank); // Original unchanged
      });

      test('copyWith without parameter keeps current theme', () {
        final state = ThemeState(themeMode: AppThemeMode.neobank);
        final newState = state.copyWith();
        
        expect(newState.themeMode, AppThemeMode.neobank);
      });
    });
  });
}

