Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B2531153
	for <lists+nbd@lfdr.de>; Mon, 23 May 2022 16:30:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5C6D420194; Mon, 23 May 2022 14:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 23 14:30:10 2022
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 05BAB20166
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 May 2022 14:12:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id T72xc4TZ0I8K for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 May 2022 14:12:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x72a.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 234EE2017A
	for <nbd@other.debian.org>; Mon, 23 May 2022 14:12:49 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id r84so1419125qke.10
        for <nbd@other.debian.org>; Mon, 23 May 2022 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D9PaxQgh0dgGWTqhmUPSOfrq/Hw+1kY6VaKwgcNAm/M=;
        b=fFXpBoD84sQ7AF2ZfHFijFUDydy/a0AwqnA2dCvm8Mj/8UQianCRe4XVRsoBfQuG2D
         ICxF4JAgz7ViGJ1oKYxAZkstk3z9csDWHCrN7zFaS2fe9Nyge/XTh6UJfs5XmHLA8Ix/
         VyqAeQnm7o5wH93bsuJtKiwbDYH+OfkHSdKBFtS18g3I2W7vHeUt3GKHMAh85K/+gY+t
         O/KB58s6E5wWXEiOCrjIEWgi5j8SBvckaZZmAOx+JsBvzs5EklxxaITJJBn2axzY2cON
         D5V/uKFrC1Cmug3j/8WqLbad+hB3tBNaOlCyKQ+DurNVcTrJLVGhktLtikOuIWgXXn1D
         0Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D9PaxQgh0dgGWTqhmUPSOfrq/Hw+1kY6VaKwgcNAm/M=;
        b=mRJhJ7yxEOq3+YV+44ucvS+Xao72/5jZsdwpSbPQry3dq8p0XkaZp0jXjjc4abWxkg
         8vndYTfizBhWveLnTH/5lSCca8/Ruhm43rT6hERyuZZvGR/Ky1p2I8SlsVU4RmCXYehE
         fwTgV/WvI8LM2NlirmkeIyIiPWFuuWNH1OvP7d9r6Akl7J1P7YuBfyf+g9+7YC7SMVUr
         GnG6aPM+oNvdLRnv6R4fHdqxv+4IVQvmYhvdZe1DeVCR0g9R66flWQZrRSO/OrKPiMpW
         B5kI3jscOrCzCL3rs7q6Y4uY6olqWFDMkAAoxeSA7EhQ17ufABpDmC0L7v9As6ZOVCd4
         fLTw==
X-Gm-Message-State: AOAM5307mkCMtP83ctLNR1xGa2/77KWOpc243NfOI8Cq3DQhbVu+u6iu
	4sTaLepjckAZcEvhdQPTz6HTqw==
X-Google-Smtp-Source: ABdhPJya52lpcsbBSkKIaQkTMnZzwxjA4yWpPSm4Nqk0vkxh0Nl49AOOILI0+gCK/4A+BtBJMJq0hQ==
X-Received: by 2002:a37:d245:0:b0:69b:f153:9c38 with SMTP id f66-20020a37d245000000b0069bf1539c38mr13876045qkj.692.1653315166256;
        Mon, 23 May 2022 07:12:46 -0700 (PDT)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id u2-20020a05620a120200b0069fc13ce206sm4289849qkj.55.2022.05.23.07.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:12:45 -0700 (PDT)
Date: Mon, 23 May 2022 10:12:44 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, ming.lei@redhat.com, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH -next v3 3/6] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if
 request is not completed
Message-ID: <YouWXEcyoBNUXLb7@localhost.localdomain>
References: <20220521073749.3146892-1-yukuai3@huawei.com>
 <20220521073749.3146892-4-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521073749.3146892-4-yukuai3@huawei.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qH9Tf2DVIuF.A.Z4B.yp5iiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2093
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YouWXEcyoBNUXLb7@localhost.localdomain
Resent-Date: Mon, 23 May 2022 14:30:10 +0000 (UTC)

On Sat, May 21, 2022 at 03:37:46PM +0800, Yu Kuai wrote:
> Otherwise io will hung because request will only be completed if the
> cmd has the flag 'NBD_CMD_INFLIGHT'.
> 
> Fixes: 07175cb1baf4 ("nbd: make sure request completion won't concurrent")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/block/nbd.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 2ee1e376d5c4..a0d0910dae2a 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -403,13 +403,14 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>  	if (!mutex_trylock(&cmd->lock))
>  		return BLK_EH_RESET_TIMER;
>  
> -	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
> +	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>  		mutex_unlock(&cmd->lock);
>  		return BLK_EH_DONE;
>  	}
>  
>  	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>  		cmd->status = BLK_STS_TIMEOUT;
> +		__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
>  		mutex_unlock(&cmd->lock);
>  		goto done;
>  	}
> @@ -478,6 +479,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>  	dev_err_ratelimited(nbd_to_dev(nbd), "Connection timed out\n");
>  	set_bit(NBD_RT_TIMEDOUT, &config->runtime_flags);
>  	cmd->status = BLK_STS_IOERR;
> +	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
>  	mutex_unlock(&cmd->lock);
>  	sock_shutdown(nbd);
>  	nbd_config_put(nbd);
> @@ -745,7 +747,7 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
>  	cmd = blk_mq_rq_to_pdu(req);
>  
>  	mutex_lock(&cmd->lock);
> -	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
> +	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>  		dev_err(disk_to_dev(nbd->disk), "Suspicious reply %d (status %u flags %lu)",
>  			tag, cmd->status, cmd->flags);
>  		ret = -ENOENT;
> @@ -854,8 +856,16 @@ static void recv_work(struct work_struct *work)
>  		}
>  
>  		rq = blk_mq_rq_from_pdu(cmd);
> -		if (likely(!blk_should_fake_timeout(rq->q)))
> -			blk_mq_complete_request(rq);
> +		if (likely(!blk_should_fake_timeout(rq->q))) {
> +			bool complete;
> +
> +			mutex_lock(&cmd->lock);
> +			complete = __test_and_clear_bit(NBD_CMD_INFLIGHT,
> +							&cmd->flags);
> +			mutex_unlock(&cmd->lock);
> +			if (complete)
> +				blk_mq_complete_request(rq);
> +		}

I'd rather this be handled in nbd_handle_reply.  We should return with it
cleared if it's ready to be completed.  Thanks,

Josef

