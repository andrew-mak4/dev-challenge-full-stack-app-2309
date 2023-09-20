using fullstack_dev_challenge as rm from '../db/data-model';

annotate fullstack_dev_challenge.Tests with {
    ID          @title: 'Test';
    title       @title: 'Title';
    description @title: 'Description'
};


annotate fullstack_dev_challenge.Questions with {
    ID     @title: 'Question';
    answer @title: 'Answer';
};

annotate fullstack_dev_challenge.Answers with {
    ID   @title: 'Answer';
    text @title: 'Answer text'
};
