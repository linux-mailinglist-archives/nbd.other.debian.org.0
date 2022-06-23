Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA2557D01
	for <lists+nbd@lfdr.de>; Thu, 23 Jun 2022 15:30:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 43FA62038B; Thu, 23 Jun 2022 13:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 23 13:30:10 2022
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=4.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,TO_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2E8A62036F
	for <lists-other-nbd@bendel.debian.org>; Thu, 23 Jun 2022 13:12:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.719 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FREEMAIL_FORGED_FROMDOMAIN=0.249,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.228,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gh-t4JKT7CC7 for <lists-other-nbd@bendel.debian.org>;
	Thu, 23 Jun 2022 13:12:16 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-f176.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AFFF420374
	for <nbd@other.debian.org>; Thu, 23 Jun 2022 13:12:16 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id k14so6639128plh.4
        for <nbd@other.debian.org>; Thu, 23 Jun 2022 06:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CSfPRsek6TY0ETOoUksAgDlvP5eJ2iNIFz8xmTeCdD8=;
        b=nv77J99k/oRL/aWV8BZujG/KTGcaDrM3gHmrglmNR29oZ9brkaljVPRHnVkHYWMmdd
         jmIqa/zXU90RYsr7MqNQiE3sGlUvw7ENIQtEG+WtKEBr7eoWx/OuNWdXTt/eyTW95JG7
         WCbRSWuBTysSGBHR+rDjGppVLTCFF68wGaz422r/SQJeqa/qoVn8ybQM3voG/uIcYKOi
         rMlbQA4UueGGLmzy1JGswyjJocwsizUSu8Gq/zrhvvi7SEG7qwhG7QfQ9Soz9NAbIOIO
         eLjCqUcaEINXULwp86YAlD8ic84MkEO54GubkS9QCv6fCyIkoJZjJPaLy3TEQxtoNI30
         iv+A==
X-Gm-Message-State: AJIora8v+/8dk0LlHQ4Y5QSaG3vpHTISc128WppHffkGuHWDCC5GZSPR
	C0+BCnNbP0jf088jgdXA0JI=
X-Google-Smtp-Source: AGRyM1tYEwNFwAtN9BR7ToQECHxeTpniI+ubUdkmlhs5UOA+4VbnyarnXYp4aWf6C5UR5DIsVBXrjw==
X-Received: by 2002:a17:903:234c:b0:16a:4d9d:ed09 with SMTP id c12-20020a170903234c00b0016a4d9ded09mr6999802plh.120.1655989933067;
        Thu, 23 Jun 2022 06:12:13 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd? ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902a70f00b0016a106cb221sm3694381plq.243.2022.06.23.06.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 06:12:12 -0700 (PDT)
Message-ID: <2a124ef2-d46a-0888-0ba9-4890f3581c81@acm.org>
Date: Thu, 23 Jun 2022 06:12:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/6] blk-mq: Drop 'reserved' arg of busy_tag_iter_fn
Content-Language: en-US
To: John Garry <john.garry@huawei.com>, axboe@kernel.dk,
 damien.lemoal@opensource.wdc.com, hch@lst.de, jejb@linux.ibm.com,
 martin.petersen@oracle.com, hare@suse.de, satishkh@cisco.com,
 sebaddel@cisco.com, kartilak@cisco.com
Cc: linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, nbd@other.debian.org
References: <1655810143-67784-1-git-send-email-john.garry@huawei.com>
 <1655810143-67784-6-git-send-email-john.garry@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1655810143-67784-6-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rgZvjXoiqdL.A.vSG.irGtiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2177
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2a124ef2-d46a-0888-0ba9-4890f3581c81@acm.org
Resent-Date: Thu, 23 Jun 2022 13:30:10 +0000 (UTC)

On 6/21/22 04:15, John Garry wrote:
> We no longer use the 'reserved' arg in busy_tag_iter_fn for any iter
> function so it may be dropped.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

