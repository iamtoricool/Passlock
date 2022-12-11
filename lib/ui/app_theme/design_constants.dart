import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passblock/ui/app_theme/app_text_constants.dart';
import 'package:passblock/ui/app_theme/theme_colors.dart';

class GetTextButton extends StatelessWidget {
  const GetTextButton({super.key, required this.isFilled, this.title});
  final bool isFilled;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return isFilled
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
              alignment: Alignment.center,
              height: 48,
              width: 380,
              decoration: BoxDecoration(
                color: ThemeColors().darkColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                title == null ? '' : '$title',
                style: GoogleFonts.poppins(
                  color: ThemeColors().whiteColor,
                  fontSize: 14,
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 14),
              alignment: Alignment.center,
              height: 48,
              width: 380,
              decoration: BoxDecoration(
                border: Border.all(color: ThemeColors().darkColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                title == null ? '' : '$title',
                style: GoogleFonts.poppins(
                  color: ThemeColors().darkColor,
                  fontSize: 14,
                ),
              ),
            ),
          );
  }
}

class OnboardItems extends StatefulWidget {
  const OnboardItems({super.key});

  @override
  State<OnboardItems> createState() => _OnboardItemsState();
}

class _OnboardItemsState extends State<OnboardItems> {
  int currentIndex = 0;
  List<int> check = [0];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  screenInfo.length, (index) => dotIndicator(index, context))
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 580,
            width: double.infinity,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: screenInfo.length,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      screenInfo[index].imageURL,
                      height: 240,
                      width: 240,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  index == screenInfo.length - 1
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                screenInfo[index].title.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    color: ThemeColors().darkColor),
                              ),
                              Container(
                                height: 4,
                                width: 42,
                                decoration: BoxDecoration(
                                    color: ThemeColors().darkColor,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                screenInfo[index].heading.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    color: ThemeColors().darkColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Text(
                                screenInfo[index].description.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: ThemeColors().darkColor),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container dotIndicator(int index, BuildContext context) {
    designCheck(int index) {
      if (currentIndex != 0 && check.contains(currentIndex)) {
        check.add(currentIndex);
        print(check);
      }
    }

    setState(() {
      designCheck(currentIndex);
    });
    return Container(
      height: 11,
      width: 105,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: currentIndex == index
              ? ThemeColors().darkColor
              : ThemeColors().whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ThemeColors().darkColor, width: 1)),
    );
  }
}
