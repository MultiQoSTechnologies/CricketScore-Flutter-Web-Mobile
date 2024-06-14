import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/entities/mdl_commentary.dart';

class CommentaryPage extends StatefulWidget {
  const CommentaryPage({super.key});

  @override
  State<CommentaryPage> createState() => _CommentaryPageState();
}

class _CommentaryPageState extends State<CommentaryPage> {
  List<MDLCommentary> commentary = [
    MDLCommentary(
        over: "0",
        ball: "0",
        message:
            "The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "0",
        ball: "1",
        message:
            "The national anthems are being sung with great passion by the fans. You can feel the pride and excitement in the air."),
    MDLCommentary(
        over: "0",
        ball: "2",
        message:
            "The referee blows the whistle and we are underway! The World Cup 2023 final has officially begun.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "1",
        ball: "1",
        message:
            "An early chance for the home team, but it's just wide of the post. The striker looks disappointed with himself there.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "2",
        ball: "3",
        message:
            "The away team is pressing high up the pitch, looking to force an error from the home team's defense. They're applying a lot of pressure.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "3",
        ball: "4",
        message:
            "What a save! The goalkeeper denies a certain goal with a fantastic reflex stop. That was a crucial intervention to keep the score level."),
    MDLCommentary(
        over: "4",
        ball: "2",
        message:
            "The home team is starting to find their rhythm and control possession. They're passing the ball around confidently, trying to create an opening.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "5",
        ball: "6",
        message:
            "A dangerous cross into the box, but it's well cleared by the defense. The defenders are staying strong and organized."),
    MDLCommentary(
        over: "6",
        ball: "1",
        message:
            "A strong challenge in midfield results in a free kick for the home team. The referee is having a word with the player, but no card is shown.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "7",
        ball: "3",
        message:
            "GOAL! The away team takes the lead with a stunning strike from outside the box. The ball flew past the goalkeeper into the top corner. What a goal!"),
    MDLCommentary(
        over: "8",
        ball: "5",
        message:
            "The home team is pushing hard for an equalizer as we approach halftime. They're attacking in numbers, trying to break down the defense.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "9",
        ball: "2",
        message:
            "Another great save by the goalkeeper to keep the home team in the game. The keeper is having an outstanding match so far.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "10",
        ball: "0",
        message:
            "Halftime: The away team leads 1-0 after a tense first half. Both teams have had their chances, but it's the away team who go into the break with the advantage."),
    MDLCommentary(
        over: "11",
        ball: "1",
        message:
            "The second half kicks off, and the home team looks determined to find a way back into this match. They're showing a lot of energy and urgency.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "12",
        ball: "3",
        message:
            "A shot from distance by the home team, but it's comfortably saved by the keeper. It was a speculative effort, but worth a try."),
    MDLCommentary(
        over: "13",
        ball: "5",
        message:
            "Penalty awarded to the home team! This could be their chance to level the score. The referee didn't hesitate to point to the spot after a clumsy challenge in the box.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "14",
        ball: "6",
        message:
            "GOAL! The home team equalizes from the penalty spot. The crowd erupts in celebration. It's all square now, 1-1!"),
    MDLCommentary(
        over: "15",
        ball: "2",
        message:
            "The momentum has shifted in favor of the home team. They're playing with renewed confidence and attacking intent.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "16",
        ball: "3",
        message:
            "A fantastic through ball splits the defense, but the striker is just offside. The linesman raises his flag, and the chance goes begging.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems.The atmosphere is electric as the players walk onto the pitch for the World Cup 2023 final! The fans are cheering loudly, waving flags and singing anthems."),
    MDLCommentary(
        over: "17",
        ball: "4",
        message:
            "End-to-end action now as both teams search for a winning goal. The match is wide open, and anything could happen in these final minutes."),
    MDLCommentary(
        over: "18",
        ball: "5",
        message:
            "What a goal! The away team scores again with a brilliant counter-attack. It was a swift and clinical move, finished off with a powerful shot into the bottom corner."),
    MDLCommentary(
        over: "19",
        ball: "6",
        message:
            "The home team is throwing everything forward in search of an equalizer. They're leaving gaps at the back, but they have no choice but to attack."),
    MDLCommentary(
        over: "20",
        ball: "1",
        message:
            "The away team's defense is holding firm despite the constant pressure. They're clearing their lines and making crucial interceptions."),
    MDLCommentary(
        over: "21",
        ball: "3",
        message:
            "Only a few minutes left and the tension is palpable. The home team is desperately trying to create one last chance."),
    MDLCommentary(
        over: "22",
        ball: "0",
        message:
            "Full-time: The away team wins the World Cup 2023 final with a 2-1 victory. What a match! The players are celebrating wildly, and the fans are in raptures. It's been an unforgettable final.")
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Commentary",
          style: AppFontStyle.interBlack23.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: Get.height - 100,
          child: ListView.builder(
            itemCount: commentary.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFB8E8BD).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${commentary[index].over}.${commentary[index].ball}",
                      style: AppFontStyle.interBlack14
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        commentary[index].message,
                        style: AppFontStyle.interRegular14
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
