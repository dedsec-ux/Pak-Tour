import 'package:flutter/material.dart';

class BookingViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> _bookings = [];
  List<Map<String, dynamic>> _filteredBookings = [];
  String _selectedStatusFilter = 'All';
  String _searchQuery = '';

  final List<String> statusFilters = ['All', 'Confirmed', 'Pending', 'Cancelled'];

  List<Map<String, dynamic>> get filteredBookings => _filteredBookings;
  String get selectedStatusFilter => _selectedStatusFilter;

  BookingViewModel() {
    _initializeBookings();
  }

  void _initializeBookings() {
    _bookings = [
      {
        'id': '1',
        'destination': 'Paris',
        'country': 'France',
        'image': 'https://picsum.photos/200/200?random=1',
        'status': 'Confirmed',
        'date': 'Dec 15-20',
        'guests': '2 Adults',
        'price': '\$1,200',
        'bookingDate': DateTime.now().subtract(const Duration(days: 5)),
      },
      {
        'id': '2',
        'destination': 'Tokyo',
        'country': 'Japan',
        'image': 'https://picsum.photos/200/200?random=2',
        'status': 'Pending',
        'date': 'Jan 10-15',
        'guests': '1 Adult',
        'price': '\$800',
        'bookingDate': DateTime.now().subtract(const Duration(days: 2)),
      },
      {
        'id': '3',
        'destination': 'New York',
        'country': 'USA',
        'image': 'https://picsum.photos/200/200?random=3',
        'status': 'Confirmed',
        'date': 'Nov 25-30',
        'guests': '3 Adults',
        'price': '\$1,500',
        'bookingDate': DateTime.now().subtract(const Duration(days: 10)),
      },
      {
        'id': '4',
        'destination': 'London',
        'country': 'UK',
        'image': 'https://picsum.photos/200/200?random=4',
        'status': 'Cancelled',
        'date': 'Oct 5-10',
        'guests': '2 Adults',
        'price': '\$900',
        'bookingDate': DateTime.now().subtract(const Duration(days: 15)),
      },
      {
        'id': '5',
        'destination': 'Dubai',
        'country': 'UAE',
        'image': 'https://picsum.photos/200/200?random=5',
        'status': 'Confirmed',
        'date': 'Feb 1-7',
        'guests': '4 Adults',
        'price': '\$2,000',
        'bookingDate': DateTime.now().subtract(const Duration(days: 1)),
      },
    ];
    
    _filteredBookings = List.from(_bookings);
  }

  void setStatusFilter(String status) {
    _selectedStatusFilter = status;
    _applyFilters();
    notifyListeners();
  }

  void searchBookings(String query) {
    _searchQuery = query.toLowerCase();
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    _filteredBookings = _bookings.where((booking) {
      // Apply status filter
      bool statusMatch = _selectedStatusFilter == 'All' || 
                        booking['status'] == _selectedStatusFilter;
      
      // Apply search filter
      bool searchMatch = _searchQuery.isEmpty ||
                        booking['destination'].toLowerCase().contains(_searchQuery) ||
                        booking['country'].toLowerCase().contains(_searchQuery);
      
      return statusMatch && searchMatch;
    }).toList();
    
    // Sort by booking date (most recent first)
    _filteredBookings.sort((a, b) => 
        b['bookingDate'].compareTo(a['bookingDate']));
  }

  void cancelBooking(String bookingId) {
    final index = _bookings.indexWhere((booking) => booking['id'] == bookingId);
    if (index != -1) {
      _bookings[index]['status'] = 'Cancelled';
      _applyFilters();
      notifyListeners();
    }
  }

  void addBooking(Map<String, dynamic> booking) {
    booking['id'] = DateTime.now().millisecondsSinceEpoch.toString();
    booking['bookingDate'] = DateTime.now();
    _bookings.insert(0, booking);
    _applyFilters();
    notifyListeners();
  }
}