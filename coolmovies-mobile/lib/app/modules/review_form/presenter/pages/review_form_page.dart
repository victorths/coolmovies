import 'package:coolmovies/app/commons/utils/exports.dart';

class ReviewFormPage extends GetView<ReviewFormController> {
  const ReviewFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final review = controller.store.review;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: controller.submitForm,
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                review.id == null ? 'New Review' : 'Edit Review',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => StarsRateForm(
                  rate: review.rating,
                  onTap: (rate) => review.rating = rate,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  label: Text('Title'),
                  hintText: 'Was it good?',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                controller: review.titleController,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('Description'),
                    hintText: 'Do you recommend it?',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  controller: review.bodyController,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FloatingActionButton(
                heroTag: 'backButton',
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 0,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Get.back(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
