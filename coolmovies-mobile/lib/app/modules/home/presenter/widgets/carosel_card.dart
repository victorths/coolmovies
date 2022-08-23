import 'package:coolmovies/app/commons/utils/exports.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    required Key key,
    required this.child,
    this.title,
    this.onTap,
    this.rate,
  }) : super(key: key);

  final Widget child;
  final Widget? title;
  final Widget? rate;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: Hero(
              tag: key!,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.64,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.tertiary.withOpacity(0.15),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: const Offset(-10, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: child,
                ),
              ),
            ),
          ),
          if (title != null)
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.64,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                    stops: const [
                      0.5,
                      1,
                    ],
                  ),
                ),
                alignment: const Alignment(0, 0.95),
                child: title,
              ),
            ),
          if (rate != null)
            Align(
              alignment: const Alignment(-1, -1),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: rate,
              ),
            ),
        ],
      ),
    );
  }
}
