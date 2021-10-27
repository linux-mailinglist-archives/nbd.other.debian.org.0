Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7870443C01F
	for <lists+nbd@lfdr.de>; Wed, 27 Oct 2021 04:42:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4D49220366; Wed, 27 Oct 2021 02:42:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 27 02:42:21 2021
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2A52E20300
	for <lists-other-nbd@bendel.debian.org>; Wed, 27 Oct 2021 02:42:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.831 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZdEaiJl2l3t1 for <lists-other-nbd@bendel.debian.org>;
	Wed, 27 Oct 2021 02:42:10 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id F3DA120340
	for <nbd@other.debian.org>; Wed, 27 Oct 2021 02:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635302525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zG4wOwNju0vbwzgcCbmJ62s9mn3CKYEpgz+8LI3TwWk=;
	b=eGaeZVxkpWWVYgrq2530lM5ATBda5UyBiiuO4wQw+IFu4tBRGt0DxfuEtYq5zn+3ZpwxUj
	lnlhd3ijsaZWPESJ1grCYHUbzXJ4VwqDsoKLWyB6KMYuz9P1r3n0vqWG5bh3mDuO4g711J
	GoFv1eAVZ2KUXJD8rLauX+M5gdZ0Z94=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-QfdCkj1HNqmpKschyX5cAQ-1; Tue, 26 Oct 2021 22:42:03 -0400
X-MC-Unique: QfdCkj1HNqmpKschyX5cAQ-1
Received: by mail-pg1-f200.google.com with SMTP id z25-20020a637e19000000b002a2d8fce9dcso763396pgc.14
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 19:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zG4wOwNju0vbwzgcCbmJ62s9mn3CKYEpgz+8LI3TwWk=;
        b=trQ4lga/4LyFngq1bxGSeERnNWIBDcCJmAuJzFu7GoyNHJmmA8JSj5e79o0vj9qjVJ
         f8Xn8AOJAUBucIEZwb1r+5FEtTALprzkTIugkg3q1MUh3l/ff4C8QadMicTilm2fEemz
         E7sJSBQP22DjVzmm6rNqYK0hNpH1TN75unNmcxU13SZDJ2sRsvEeFtVUE2yWErgjQT1c
         vOZZsQEj0W2I7SiIy5jab4yNBEJ6K4SwNy3IQQuBf/Az8hew9SvsL7id3NBRka2D9L4d
         8g1mwqTEG6xKyZAWhcsy9nsxkaCCTB7JA/FEVnESn6ENGFfXUoXerTJET1CbNVCLLdB1
         r7iA==
X-Gm-Message-State: AOAM531fjnxBuN/IBCCjH+hJdLIKxGBRXIcf5MGfsXT3BLxMlz8yW5yK
	A4xJcZbY2UZpfeAK5rryWPKzacGLSSDZ33shFuEXugEMxYvUJwqvxtbi4EPUYxYvSNsw3u+G9Wc
	bs2j4x1CXt1DASA==
X-Received: by 2002:a17:90b:3841:: with SMTP id nl1mr2843356pjb.24.1635302522764;
        Tue, 26 Oct 2021 19:42:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7/5OU3lvyXYztvEXb/ExmtHdCQzdKN/vMBrgbJMaHdW2excTPY8LP3gMdhwF+AdVbp7nbAA==
X-Received: by 2002:a17:90b:3841:: with SMTP id nl1mr2843329pjb.24.1635302522512;
        Tue, 26 Oct 2021 19:42:02 -0700 (PDT)
Received: from [10.72.12.93] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id mi11sm2170281pjb.5.2021.10.26.19.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 19:42:01 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] nbd: reset the queue/io_timeout to default on
 disconnect
To: pkalever@redhat.com, linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, josef@toxicpanda.com,
 axboe@kernel.dk, idryomov@redhat.com,
 Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
References: <20210806142914.70556-1-pkalever@redhat.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <c46ab94d-4e09-f74d-3d05-789cb47c1057@redhat.com>
Date: Wed, 27 Oct 2021 10:41:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210806142914.70556-1-pkalever@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xiubli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BzMhfss6OQK.A.RLD.NyLehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1581
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c46ab94d-4e09-f74d-3d05-789cb47c1057@redhat.com
Resent-Date: Wed, 27 Oct 2021 02:42:21 +0000 (UTC)


On 8/6/21 10:29 PM, pkalever@redhat.com wrote:
> From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
>
> Hi,
>
> This series has changes to reset the queue/io_timeout for nbd devices and
> a cleanup patch.
>
> Thank you!
>
> Prasanna Kumar Kalever (2):
>    block: cleanup: define default command timeout and use it
>    nbd: reset the queue/io_timeout to default on disconnect
>
>   block/blk-mq.c         | 2 +-
>   drivers/block/nbd.c    | 9 +++++++--
>   include/linux/blkdev.h | 2 ++
>   3 files changed, 10 insertions(+), 3 deletions(-)
>
This series LGTM.

Reviewed-by: Xiubo Li <xiubli@redhat.com>

