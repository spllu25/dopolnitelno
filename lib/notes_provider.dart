import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

// Провайдер для заметок
final notesProvider = StateNotifierProvider<NotesNotifier, List<String>>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final savedNotes = sharedPreferences.getStringList('notes') ?? [];
  return NotesNotifier(savedNotes);
});

// Провайдер для контактов
final contactsProvider = StateNotifierProvider<ContactsNotifier, List<String>>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final savedContacts = sharedPreferences.getStringList('contacts') ?? [];
  return ContactsNotifier(savedContacts);
});

// Провайдер для личного
final lichnProvider = StateNotifierProvider<LichnNotifier, List<String>>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final savedLichn = sharedPreferences.getStringList('lichn') ?? [];
  return LichnNotifier(savedLichn);
});

// Провайдер для конфиденциального
final confidProvider = StateNotifierProvider<ConfidNotifier, List<String>>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  final savedConf = sharedPreferences.getStringList('confid') ?? [];
  return ConfidNotifier(savedConf);
});

class NotesNotifier extends StateNotifier<List<String>> {
  NotesNotifier(List<String> state) : super(state);

  void add(String note) {
    state = [...state, note];
    save('notes');
  }

  void removeAt(int index) {
    state = List.from(state)..removeAt(index);
    save('notes');
  }

  void save(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(key, state);
  }
}

class ContactsNotifier extends StateNotifier<List<String>> {
  ContactsNotifier(List<String> state) : super(state);

  void add(String contact) {
    state = [...state, contact];
    save('contacts');
  }

  void removeAt(int index) {
    state = List.from(state)..removeAt(index);
    save('contacts');
  }

  void save(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(key, state);
  }
}

class LichnNotifier extends StateNotifier<List<String>> {
  LichnNotifier(List<String> state) : super(state);

  void add(String note) {
    state = [...state, note];
    save('lichn');
  }

  void removeAt(int index) {
    state = List.from(state)..removeAt(index);
    save('lichn');
  }

  void save(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(key, state);
  }
}

class ConfidNotifier extends StateNotifier<List<String>> {
  ConfidNotifier(List<String> state) : super(state);

  void add(String note) {
    state = [...state, note];
    save('confid');
  }

  void removeAt(int index) {
    state = List.from(state)..removeAt(index);
    save('confid');
  }

  void save(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(key, state);
  }
}