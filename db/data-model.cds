using {
  cuid,
  managed
} from '@sap/cds/common';

namespace fullstack_dev_challenge;

entity Tests : cuid, managed {
  title       : String;
  description : String;
  questions   : Composition of many Questions
                  on questions.test = $self;
}

define entity Questions : cuid {
  text   : String;
  test   : Association to many Tests;
  answer : Composition of one Answers;
}

aspect Answers: cuid {
  text     : String;
  question : Composition of one Questions;
}
