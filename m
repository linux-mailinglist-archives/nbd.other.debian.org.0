Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D26ED2EF
	for <lists+nbd@lfdr.de>; Mon, 24 Apr 2023 18:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2DFC0207B8; Mon, 24 Apr 2023 16:57:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 24 16:57:12 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 56C81207E6
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Apr 2023 16:39:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.019 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1fyU5YJ3IRPs for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Apr 2023 16:39:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 41465207E2
	for <nbd@other.debian.org>; Mon, 24 Apr 2023 16:39:35 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-763740a7f31so14293539f.0
        for <nbd@other.debian.org>; Mon, 24 Apr 2023 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1682354372; x=1684946372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4EQyKul/PdMUukH7r+B8jj3xQ5gjwr3+n4cMj9T93M=;
        b=29hXv3LfoLDsyNLiV0sfsQ2fn8nNm+A8pxirwf0CJw6BzcQlwfzRksV2KCNtPYnjo/
         1BT1zoykFbJcHgasIxZHCh8X+sDWp3bV5/ZiYWkNNAj8XQ0JF8yw6y2YVBhM2P6/Ng/9
         Ey4+LPNv1vD1kBOiaOhQUktdJMX5L7iCZaWGNhMly4NdzLpuSyqaEutLzhiAkwwpG8sY
         3wTfCAASktnW6QPnwPifGp59NTq0/xw0GmNzFCkvxgkRkg9DeC79NJou/QpDVikoPsSI
         4Vz8StPE7ZoPp6a9+y8axPIWdvbe8sg7PZwGFlXWzk6rXEVS5zXVc6+m+ea2fVHFPHAA
         Z/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354372; x=1684946372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4EQyKul/PdMUukH7r+B8jj3xQ5gjwr3+n4cMj9T93M=;
        b=E4G3byPklmdAe++N9PJIPmQgqAo0Whzqp929AH/O5P6lLSLUERusBfoUJ5FvRLOLx7
         QehVyON2jN5BCXix1ag5/4azJ7on0Pz8qrjQXGI5QSmEk67qTe1ixddZz1Gj4L4hAV3r
         k2+bOAzj+5fvWcQh++OJbE8ekdLOGRPnjbruqXPHWqaUyMtfEkfNghNSyex0srFOlWjl
         pOTRLvmoWtYtiyR4gKqRlD3qbwvyCu/mBs4uqErFWgl9554mT6Z2JW313UZrsXa2li/j
         1GAXgOzDsCCPOVrUXG3tGNHES7aUG2TYzBuJ0h/0NAiE7NLSQhJWnIT5z7LY7rEgCDdQ
         QfbA==
X-Gm-Message-State: AAQBX9d+nvs2qO2vEiziZFaQuRQaq7CTpYDVv8+4+ZRUpkSxkMosy79K
	mOEnSEy0WxORA3oEA3HZN1opsA==
X-Google-Smtp-Source: AKy350ajXxXeVsLsPGCPIDs2KWsbK3IbqXDcwyhmCVO7RwKx5h+Hj/ArBKuJkx40ZgROUWHvnlluAw==
X-Received: by 2002:a5d:9d90:0:b0:760:dfd3:208d with SMTP id ay16-20020a5d9d90000000b00760dfd3208dmr10585566iob.0.1682354371932;
        Mon, 24 Apr 2023 09:39:31 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id cp14-20020a056638480e00b00411c415b4acsm495470jab.19.2023.04.24.09.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 09:39:31 -0700 (PDT)
Message-ID: <17f55b16-cc5f-a585-baa3-2a39cb5e9cf3@kernel.dk>
Date: Mon, 24 Apr 2023 10:39:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/5] block/drivers: don't clear the flag that is not set
Content-Language: en-US
To: Chaitanya Kulkarni <kch@nvidia.com>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org
Cc: josef@toxicpanda.com, minchan@kernel.org, senozhatsky@chromium.org,
 colyli@suse.de, kent.overstreet@gmail.com, dlemoal@kernel.org,
 johannes.thumshirn@wdc.com, bvanassche@acm.org, vincent.fu@samsung.com,
 akinobu.mita@gmail.com, shinichiro.kawasaki@wdc.com, nbd@other.debian.org
References: <20230424073023.38935-1-kch@nvidia.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230424073023.38935-1-kch@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JKJSUcE9ifP.A.vVF.oTrRkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2453
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/17f55b16-cc5f-a585-baa3-2a39cb5e9cf3@kernel.dk
Resent-Date: Mon, 24 Apr 2023 16:57:12 +0000 (UTC)

On 4/24/23 1:30?AM, Chaitanya Kulkarni wrote:
> Hi,
> 
> The drivers in this patch-series tries to clear the
> QUEUE_FLAG_ADD_RANDOM that is not set at all in the queue allocation
> and initialization path in :-

Just roll this into one, as it should be a non-functional change since
we don't default to ADD_RANDOM with MQ ops. And then change the title to
something meaningful, ala:

block/drivers: remove dead clear of QUEUE_FLAG_ADD_RANDOM

or something like that, as your title currently makes very little sense
(eg it's hard to parse and it doesn't really say what is being done).

-- 
Jens Axboe

