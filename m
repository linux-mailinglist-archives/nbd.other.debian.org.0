Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8111784FA
	for <lists+nbd@lfdr.de>; Tue,  3 Mar 2020 22:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F028A20172; Tue,  3 Mar 2020 21:36:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  3 21:36:08 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 198C12013F
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Mar 2020 21:18:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2fkT0-Edx1D8 for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Mar 2020 21:18:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf41.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AB76D20132
	for <nbd@other.debian.org>; Tue,  3 Mar 2020 21:18:17 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id p3so36750qvq.0
        for <nbd@other.debian.org>; Tue, 03 Mar 2020 13:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=suhh+kDG7gHdHRASogA0YlonJrkSmt2vdfbF/XvnQ50=;
        b=NUsAHWWHr0HStCn+DxrBX766Zu1J/a33P35eJKRiD23wR2U/F04MO1E/6BXwCh9RuK
         RrfmDCe/PZyUoKm9/im/HNiixkRZwaDuLjatSbfUUNhgYsujM7wrgyXqQYmUP1tHim5W
         FQ3/MWS9+ZzxyeH+E3UCgFI2qesNzVWyb93VgUchqj9OAMY12Th/Yecvyg+ggCDI3Wdt
         5c8zaxAjj0SWDDXL/iSE3Od3PXjVetMtwAEjehOPfs6GRG+Q8f84He9m9NTsHaJYbw5g
         L4GbITjb+7LX7GQytuyl7R2O3diTL72x7eDvIpba/O3hJzE/794CjQvRma1NbLICHzTa
         iBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=suhh+kDG7gHdHRASogA0YlonJrkSmt2vdfbF/XvnQ50=;
        b=E33j/QDre16C5Z07viwTVIvSlnokVhD6lUp8V6Q7zxiqWQSfjfDx0BfkwfaRkrpMop
         +tTgJBbuch/sD3cB76p/ri8168Tgdt4vk2mMNZERLTLZcQY+TluXohcSTitVJlO6RTme
         tt85hi89RE57E0UjQRbLAG/P9vzxOvtqh7ODQOji1KI9uanu7GPo+tRn4BIdjcxpon7i
         uuAmgStJGGwpS4HF1UHRUDKlmY6hgiJjl67K2qnEC+5MoJgB4WOJU4R7iGq34POIDj+D
         p/BpBMhGuvanLNhRXtHiMWGdEQlYsbxnJe6AW+igPpUln2tjBk5GhFeliTKPYZQzK2X0
         LM6A==
X-Gm-Message-State: ANhLgQ2Tvt8B4GOZQKs68a6TeXTeGMqiulL5jvG2tmbkgyu5fY46Z735
	oZ4ZjkYMEYpi0AoEGR/PO+03dwk1Kyg=
X-Google-Smtp-Source: ADFU+vuV8ouvAWeJOxM3whNkg4pziPVgu9wbWJLJ93huStem10PzL4JYZrvVgbG7upUycURMfCWe5w==
X-Received: by 2002:a05:6214:1050:: with SMTP id l16mr5857619qvr.25.1583270293722;
        Tue, 03 Mar 2020 13:18:13 -0800 (PST)
Received: from [192.168.1.106] ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id j7sm9054018qti.14.2020.03.03.13.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 13:18:12 -0800 (PST)
Subject: Re: [PATCH] nbd: make starting request more reasonable
To: Yufen Yu <yuyufen@huawei.com>, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200303130843.12065-1-yuyufen@huawei.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <2976065c-ae72-08d4-32ca-89b0f24ded74@toxicpanda.com>
Date: Tue, 3 Mar 2020 16:18:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303130843.12065-1-yuyufen@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Z2AVKf2jGgC.A.GrB.I3sXeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/841
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2976065c-ae72-08d4-32ca-89b0f24ded74@toxicpanda.com
Resent-Date: Tue,  3 Mar 2020 21:36:08 +0000 (UTC)

On 3/3/20 8:08 AM, Yufen Yu wrote:
> Our test robot reported a warning for refcount_dec trying to decrease
> value '0'. The reason is that blk_mq_dispatch_rq_list() try to complete
> the failed request from nbd driver, while the request have finished in
> nbd timeout handle function. The race as following:
> 
> CPU1                             CPU2
> 
> //req->ref = 1
> blk_mq_dispatch_rq_list
> nbd_queue_rq
>    nbd_handle_cmd
>      blk_mq_start_request
>                                   blk_mq_check_expired
>                                     //req->ref = 2
>                                     blk_mq_rq_timed_out
>                                       nbd_xmit_timeout
>                                         blk_mq_complete_request
>                                           //req->ref = 1
>                                           refcount_dec_and_test(&req->ref)
> 
>                                     refcount_dec_and_test(&req->ref)
>                                     //req->ref = 0
>                                       __blk_mq_free_request(req)
>    ret = BLK_STS_IOERR
> blk_mq_end_request
> // req->ref = 0, req have been free
> refcount_dec_and_test(&rq->ref)
> 
> In fact, the bug also have been reported by syzbot:
>    https://lkml.org/lkml/2018/12/5/1308
> 
> Since the request have been freed by timeout handle, it can be reused
> by others. Then, blk_mq_end_request() may get the re-initialized request
> and free it, which is unexpected.
> 
> To fix the problem, we move blk_mq_start_request() down until the driver
> will handle the request actully. If .queue_rq return something error in
> preparation phase, timeout handle may don't need. Thus, moving start
> request down may be more reasonable. Then, nbd_queue_rq() will not return
> BLK_STS_IOERR after starting request.
> 

This won't work, you have to have the request started if you return an error 
because of this in blk_mq_dispatch_rq_list

                 if (unlikely(ret != BLK_STS_OK)) {
                         errors++;
                         blk_mq_end_request(rq, BLK_STS_IOERR);
                         continue;
                 }

The request has to be started before we return an error, pushing it down means 
we have all of these error cases where we haven't started the request.  Thanks,

Josef

