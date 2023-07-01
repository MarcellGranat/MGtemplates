function fetchPollData(pollId) {
  const api_url = `https://api.strawpoll.com/v3/polls/${pollId}`;

  const headers = {
    "Accept": "application/json",
    "X-API-Key": "33f35a8e-1761-11ee-96fb-dd98527c61c9"
  };

  fetch(api_url, {
    headers: headers
  })
    .then(response => response.json())
    .then(poll_data => {
      console.log(poll_data.title);

      const poll_options = poll_data.poll_options;
      poll_options.forEach(option => {
        console.log(`Name: ${option.value}, Value: ${option.vote_count}`);
      });
    });
}
