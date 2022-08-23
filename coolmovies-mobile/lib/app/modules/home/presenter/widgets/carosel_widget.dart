import 'package:coolmovies/app/commons/utils/exports.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CarouselCard> items;

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.items,
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height * 0.7,
        viewportFraction: 0.8,
      ),
      carouselController: controller,
    );
  }
}
