Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761AC2671
	for <lists+nbd@lfdr.de>; Mon, 30 Sep 2019 22:18:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 24B792055C; Mon, 30 Sep 2019 20:18:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 30 20:18:08 2019
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3D93620516
	for <lists-other-nbd@bendel.debian.org>; Mon, 30 Sep 2019 20:01:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.556 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FREEMAIL_FORGED_FROMDOMAIN=0.174,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id n5Bw0Vj458D4 for <lists-other-nbd@bendel.debian.org>;
	Mon, 30 Sep 2019 20:01:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-f193.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 223262050C
	for <nbd@other.debian.org>; Mon, 30 Sep 2019 20:01:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s17so4311503plp.6
        for <nbd@other.debian.org>; Mon, 30 Sep 2019 13:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UmfTonvoYn/sz7KFi8ddR6otlUnEOyJ4JIchPng5apk=;
        b=s0og9r6PCbRPEl7o0iOS2BIWF2yY/2gnXQPvZNrYcLtBDdnVta3KLAca03WMZ9hser
         LyMPDqXckX8e71bHPN8nhXlKIyC+xO5GGdTrZd9CAhwWLUOYYudTb1a56nrIZFgWHvJs
         mtpCDdPID8ziILLI6PKshIO9dsJCoynAAnCu3NydPG2EczQrynpRWp8Nr0JZwtMiBoH5
         lU3jpVg9SJm1bdabEzkI4scXLYwnWJjFyBpq9Rh2CYbmFg+Cvoz8yS9xyA0gwI0bncQu
         N+jQqq115xB9LfeGI9sPwEh+ra2XCHd0u8OlqolNbKWPkUvYnP1p9rEXfJuY20tWm2DD
         QO9Q==
X-Gm-Message-State: APjAAAX2+hoxXiwQ1X7MTtFVK0BmL5NMLl5pRfDm9CRfb7dW0aHIA5DK
	VHIQnC6SP3RHlLNSIXscLWU=
X-Google-Smtp-Source: APXvYqzbrSXpsKliVwn/NaAkhG1dBCmQeIWrM1t1mWJH2RQEgJUdDCSsZ6p1pPQ+4rLLp3sAiSHCnw==
X-Received: by 2002:a17:902:bd88:: with SMTP id q8mr22421320pls.288.1569873208094;
        Mon, 30 Sep 2019 12:53:28 -0700 (PDT)
Received: from ?IPv6:2620:15c:2c1:200:fb9c:664d:d2ad:c9b5? ([2620:15c:2c1:200:fb9c:664d:d2ad:c9b5])
        by smtp.gmail.com with ESMTPSA id w27sm9598997pfq.32.2019.09.30.12.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:53:27 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] blk-mq: Inline request status checkers
To: "Pavel Begunkov (Silence)" <asml.silence@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 linux-nvme@lists.infradead.org
References: <1cd320dad54bd78cb6721f7fe8dd2e197b9fbfa2.1569830796.git.asml.silence@gmail.com>
 <e6fc239412811140c83de906b75689530661f65d.1569872122.git.asml.silence@gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <e4d452ad-da24-a1a9-7e2d-f9cd5d0733da@acm.org>
Date: Mon, 30 Sep 2019 12:53:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e6fc239412811140c83de906b75689530661f65d.1569872122.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <csdhykmhiSB.A.nvH.AMmkdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/700
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e4d452ad-da24-a1a9-7e2d-f9cd5d0733da@acm.org
Resent-Date: Mon, 30 Sep 2019 20:18:08 +0000 (UTC)

On 9/30/19 12:43 PM, Pavel Begunkov (Silence) wrote:
> @@ -282,7 +282,7 @@ static bool bt_tags_iter(struct sbitmap *bitmap, un=
signed int bitnr, void *data)
>  	 * test and set the bit before assining ->rqs[].
>  	 */
>  	rq =3D tags->rqs[bitnr];
> -	if (rq && blk_mq_request_started(rq))
> +	if (rq && blk_mq_rq_state(rq) !=3D MQ_RQ_IDLE)
>  		return iter_data->fn(rq, iter_data->data, reserved);
> =20
>  	return true>
> @@ -360,7 +360,7 @@ static bool blk_mq_tagset_count_completed_rqs(struc=
t request *rq,
>  {
>  	unsigned *count =3D data;
> =20
> -	if (blk_mq_request_completed(rq))
> +	if (blk_mq_rq_state(rq) =3D=3D MQ_RQ_COMPLETE)
>  		(*count)++;
>  	return true;
>  }

Changes like the above significantly reduce readability of the code in
the block layer core. I don't like this. I think this patch is a step
backwards instead of a step forwards.

Bart.

