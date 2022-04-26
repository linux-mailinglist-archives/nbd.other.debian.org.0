Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A485100A9
	for <lists+nbd@lfdr.de>; Tue, 26 Apr 2022 16:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 85C8A202ED; Tue, 26 Apr 2022 14:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 26 14:42:09 2022
Old-Return-Path: <sagigrim@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=CC_TOO_MANY,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 839C920372
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Apr 2022 14:25:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.74 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FREEMAIL_FORGED_FROMDOMAIN=0.249,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-3.247,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id j07ewVdZcPlB for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Apr 2022 14:25:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-wr1-f45.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 37AA4202DF
	for <nbd@other.debian.org>; Tue, 26 Apr 2022 14:25:19 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id x18so25772740wrc.0
        for <nbd@other.debian.org>; Tue, 26 Apr 2022 07:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=hxfPzyAYJ7w1dcANghDmzUyQnlupyBCh11iT4xtrS+vWZCEw0xPpL7kv7SY7I2vKi6
         Y9HQhr+PtIyZmFUsdtXQ2tsYwj49+EAAnbgrzAbbyeD3fEMsr531sgDi01SY8fayTTi9
         UjFKFFPayPd+6XtBXQcKmjE7qaAs5K5UouZTl8499iQl4/UsXmTtwjooX9xkJiHlyKad
         2ujCmKkWJdniCUGkSSnYqISwUdxZLvlTPZkF+PfpwSVa43ORkrLGYu40QSo8BMFcJbY0
         hDLdKb86GiY+ktqKO+z1DPsDG+I8xauYx6JPq8NaAlmeTOkfgSezpcIX0U6V58vUGwsf
         bQbg==
X-Gm-Message-State: AOAM532lMkeL1A1WCTBLx/zsLzN0Afje5RS1seRVj4HjW1M5iFnBxbK2
	5E+eRyxH22gcZPVI+XqpOXg=
X-Google-Smtp-Source: ABdhPJx+tGjrozc2v+hkDAQGkKaaKd6tvj25GGtU09S+2P3NV6/kZmjHHHaKsKLq0MduUfwGvhoEcw==
X-Received: by 2002:a05:6000:1a8d:b0:20a:ab7c:efb1 with SMTP id f13-20020a0560001a8d00b0020aab7cefb1mr18901071wry.716.1650983116938;
        Tue, 26 Apr 2022 07:25:16 -0700 (PDT)
Received: from [192.168.64.180] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id j39-20020a05600c1c2700b00393ee3deaf1sm5525786wms.9.2022.04.26.07.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 07:25:16 -0700 (PDT)
Message-ID: <c658f5cc-7b9a-84ee-ac22-cefc03e3dbf2@grimberg.me>
Date: Tue, 26 Apr 2022 17:25:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/11] nvme: remove a spurious clear of discard_alignment
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
 Johannes Berg <johannes@sipsolutions.net>, Josef Bacik
 <josef@toxicpanda.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Mike Snitzer <snitzer@kernel.org>,
 Song Liu <song@kernel.org>, Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 nbd@other.debian.org, virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 dm-devel@redhat.com
References: <20220418045314.360785-1-hch@lst.de>
 <20220418045314.360785-10-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20220418045314.360785-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Uxsw-ZFuoML.A.Ma.BTAaiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2057
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c658f5cc-7b9a-84ee-ac22-cefc03e3dbf2@grimberg.me
Resent-Date: Tue, 26 Apr 2022 14:42:09 +0000 (UTC)

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

