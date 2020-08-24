Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 188F324F4EB
	for <lists+nbd@lfdr.de>; Mon, 24 Aug 2020 10:42:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 06AE8204A9; Mon, 24 Aug 2020 08:42:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 24 08:42:25 2020
Old-Return-Path: <sagigrim@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=CC_TOO_MANY,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AFFD32044D
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Aug 2020 08:26:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.965 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FREEMAIL_FORGED_FROMDOMAIN=0.001,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.048,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.107,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EEnJbzRejjPh for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Aug 2020 08:26:10 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-f170.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7698A20448
	for <nbd@other.debian.org>; Mon, 24 Aug 2020 08:26:10 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id k13so3853297plk.13
        for <nbd@other.debian.org>; Mon, 24 Aug 2020 01:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=rMWfT5JCHmscQ3XrHO4ACFSNNOfNx/+u9t84qvjvY267cryKZS47hnhD9/PBV+bjfO
         y8atd2olDDVOt3Wgcqw4Oq4GCmb1ITl51KaAkYUqMfhUEVH6GGK35BF7sqQBzkSZzESE
         1NBRoVQJ6s0auE+3XuDABaqTj8E+vtPFN8r1BJq4Uuas7uwujHhHKHMemRFAg+agLdo0
         cFEDEnmdrqkKv/14dfzeN5/ramNQRnOu28PsI1JR1AipZIEXKscNfVzMcNuJNJj7qrhE
         W65qA0j4XTmsTzU+OBh2TDMsW5/dtRluGdqNxT6seAerP8IQdf4JukV6wQbKWvt2Wh6e
         m3sw==
X-Gm-Message-State: AOAM531WpcQjN5zzyepGi1Fh0m8nOzSBlm/7/5UppnQFKE0XjE+3UmeZ
	ckVIEu8sww2XT0k8Mh/FHUxkBB5DbVln+Q==
X-Google-Smtp-Source: ABdhPJwX8zNdc7jFiZkEPKaTs4v/SLmNt0Dx7a+U6l+UKbsqW6vA00T1N6wB/78LH4C1jRnOhLPIPg==
X-Received: by 2002:a17:902:6ac9:: with SMTP id i9mr3156325plt.128.1598257566796;
        Mon, 24 Aug 2020 01:26:06 -0700 (PDT)
Received: from ?IPv6:2601:647:4802:9070:cda6:bf68:c972:645d? ([2601:647:4802:9070:cda6:bf68:c972:645d])
        by smtp.gmail.com with ESMTPSA id k5sm9452366pjq.5.2020.08.24.01.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 01:26:06 -0700 (PDT)
Subject: Re: [PATCH 2/3] block: fix locking for struct block_device size
 updates
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-s390@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Justin Sanders <justin@coraid.com>, linux-nvme@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Xianting Tian <xianting_tian@126.com>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Stefan Haberland <sth@linux.ibm.com>,
 nbd@other.debian.org
References: <20200823091043.2600261-1-hch@lst.de>
 <20200823091043.2600261-3-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <4021e83a-b107-df28-2266-38648c769c9d@grimberg.me>
Date: Mon, 24 Aug 2020 01:26:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823091043.2600261-3-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kOJQLLYQcOI.A.kJF.x13QfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/950
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4021e83a-b107-df28-2266-38648c769c9d@grimberg.me
Resent-Date: Mon, 24 Aug 2020 08:42:26 +0000 (UTC)

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

