Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D195557CEA
	for <lists+nbd@lfdr.de>; Thu, 23 Jun 2022 15:27:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2EF1B20389; Thu, 23 Jun 2022 13:27:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 23 13:27:13 2022
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=4.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	TO_TOO_MANY,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2BFF92036F
	for <lists-other-nbd@bendel.debian.org>; Thu, 23 Jun 2022 13:11:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.716 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FREEMAIL_FORGED_FROMDOMAIN=0.249,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.228,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M9hT3_5uEVZR for <lists-other-nbd@bendel.debian.org>;
	Thu, 23 Jun 2022 13:11:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pj1-f53.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6A21120363
	for <nbd@other.debian.org>; Thu, 23 Jun 2022 13:11:04 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so2521049pjz.1
        for <nbd@other.debian.org>; Thu, 23 Jun 2022 06:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=68nt+J0G/haWsaqcORubs5/O2GXyfdJNdDR4QR4VCKw=;
        b=sVvGnGE7tfrQcZgXjjMrr1JZF0x9eyoAI2ghF2/i4IYaUby88qSG+ZxSlnDX+rBceQ
         H1hAAUwkMi8UYZAUTrsl4xD/73iZetOnH4lUUuuJDnU2eP+hklinqSgHCHmAMwKJ3+/e
         HgLEK99y6ZsWpWczgCRgxFdVlSNReJ0YwoJCEbJy5KkwbjQyjJOByvbwQlR4P6Ok6IMt
         ojDYksmu1AbywlXptFBtDPNGfUfqpP4+StZwDJAtkx8krC/qNJbGW/0VQ+kNGusIf0I+
         yhO2+ppcDGDytjiq3BvJyfvgViIKAcNZm2rcm4IXMgJpnnweDxUovkY0heoJJlN+tXkA
         dyDQ==
X-Gm-Message-State: AJIora964AJ1K/kK96B4uTI910h3rVrlJUKylmLtFOGUhxNoda07v+cy
	dLRgmXpAZxsSfQZpIZImcP4=
X-Google-Smtp-Source: AGRyM1ug8aOaBKwK2eQ4pDHsrijU8aBX0RbI1irUvRXGrh/3bVzmBklJ17kBxFIfIHeCUSDk8qqjYg==
X-Received: by 2002:a17:90b:4c8a:b0:1e3:60f:58c3 with SMTP id my10-20020a17090b4c8a00b001e3060f58c3mr4043995pjb.230.1655989860307;
        Thu, 23 Jun 2022 06:11:00 -0700 (PDT)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd? ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
        by smtp.gmail.com with ESMTPSA id jf12-20020a170903268c00b0016a0ac06424sm11978240plb.51.2022.06.23.06.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 06:10:59 -0700 (PDT)
Message-ID: <3a2a2d1a-ab52-687d-d521-4a05d7047701@acm.org>
Date: Thu, 23 Jun 2022 06:10:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 6/6] blk-mq: Drop local variable for reserved tag
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
 <1655810143-67784-7-git-send-email-john.garry@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1655810143-67784-7-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hIJBvoZLIbF.A.RyE.xoGtiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2176
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3a2a2d1a-ab52-687d-d521-4a05d7047701@acm.org
Resent-Date: Thu, 23 Jun 2022 13:27:13 +0000 (UTC)

On 6/21/22 04:15, John Garry wrote:
> The local variable is now only referenced once so drop it.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

