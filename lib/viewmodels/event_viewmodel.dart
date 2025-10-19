import 'package:flelobna/data/repositories/event_repository.dart';
import 'package:flelobna/models/event.dart';
import 'package:get/get.dart';

/// ViewModel for Events
class EventViewModel extends GetxController {
  final EventRepository _repository = EventRepository();

  // Observable state
  final RxList<Event> events = <Event>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadEvents();
  }

  /// Load events from repository
  void _loadEvents() {
    _repository.getEventsStream().listen(
      (eventsList) {
        events.value = eventsList;
      },
      onError: (error) {
        errorMessage.value = 'Error loading events: $error';
        print(errorMessage.value);
      },
    );
  }

  /// Get upcoming events
  List<Event> get upcomingEvents => events.where((e) => e.isUpcoming).toList();
  
  /// Get ongoing events
  List<Event> get ongoingEvents => events.where((e) => e.isOngoing).toList();
  
  /// Get past events
  List<Event> get pastEvents => events.where((e) => e.isPast).toList();

  /// Get events by category
  List<Event> getEventsByCategory(String category) {
    return events.where((e) => e.category == category).toList();
  }

  /// Load upcoming events
  Future<void> loadUpcomingEvents() async {
    try {
      isLoading.value = true;
      await _repository.getUpcomingEvents();
      // Events are already being updated via stream
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'Error loading upcoming events: $e';
      isLoading.value = false;
    }
  }

  /// Refresh events
  Future<void> refreshEvents() async {
    // The stream will automatically update
    await Future.delayed(Duration(milliseconds: 500));
  }

  /// Get event by ID
  Future<Event?> getEventById(String eventId) async {
    try {
      return await _repository.getEventById(eventId);
    } catch (e) {
      errorMessage.value = 'Error getting event: $e';
      return null;
    }
  }
}

