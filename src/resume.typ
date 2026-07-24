#import "lib.typ": (
  conf, award-item, edu-item, experience-item, pub-full,
  service-item,
)

#set page(
  paper: "us-letter",
  margin: 1in,
)
#set document(title: [Yage Hu])

#show: conf.with()

#title()
#align(center, [
  #link("yagejhu@gmail.com") | #link("yage.hu@uga.edu") | 530-379-5631
])

= Industry Experience

#yaml("work.yaml").filter(x => x.resume).map(experience-item).join(v(0.5em))

= Education

#yaml("edu.yaml").map(edu-item).join(v(0.5em))

= Publications

#pub-full(yaml("pub.yaml"))
