import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewCardWidget extends StatefulWidget {
  const ReviewCardWidget({
    Key? key,
    required this.review,
    required this.onEdit,
  }) : super(key: key);

  final ReviewEntity review;
  final VoidCallback onEdit;

  @override
  State<ReviewCardWidget> createState() => _ReviewCardWidgetState();
}

class _ReviewCardWidgetState extends State<ReviewCardWidget> {
  final currentUser = Get.find<UserStore>().currentUser;

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => setState(() {
          expanded = !expanded;
        }),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.review.reviewer.id == currentUser?.id ? 'You' : widget.review.reviewer.name),
                      StarsRateWidget(
                        rate: widget.review.rating.toDouble(),
                      ),
                    ],
                  ),
                  if (widget.review.reviewer.id == currentUser?.id)
                    IconButton(
                        onPressed: widget.onEdit,
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).colorScheme.secondary,
                        ))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.review.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.review.body,
                textAlign: TextAlign.justify,
                maxLines: expanded ? null : 2,
                overflow: expanded ? null : TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
