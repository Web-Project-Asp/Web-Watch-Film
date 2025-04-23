$(function () {
    $.ajax({
        url: '/api/user/favorites',
        method: 'GET',
        success: function (response) {
            
            $(".t-movie-section").empty();
            response.forEach((elm, index) => {
                var htmlElm = `
                    <a class="t-movie">
                        <form action="/Movie/Index" method="post">
                            <input type="hidden" name="movieId" value="${elm.MediaId}" />
                            <button type="submit" style="border:none; background:none;">
                                <img src="/images/medias/${elm.MediaImagePath}" alt="${elm.MediaName}" />
                            </button>
                        </form>

                        <div class="t-movie-content">
                            <div class="t-movie-title">${elm.MediaName}</div>
                            <div class="t-movie-info">
                                <div><i class="bx bxs-star"></i><span>9.5</span></div>
                                <div><i class="bx bxs-time"></i><span>${elm.MediaDuration}</span></div>
                                <div><span>${elm.MediaQuality}</span></div>
                                <div><span>${elm.MediaAgeRating}</span></div>
                            </div>
                        </div>
                    </a>
                `;
                $(".t-movie-section").append(htmlElm);
            });
        },
        error: function (xhr, status, error) {
            console.error('Lỗi:', error);
        }
    });
});
