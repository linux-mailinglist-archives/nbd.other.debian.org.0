Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AFD54FBCE
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 19:00:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DEDE2203DF; Fri, 17 Jun 2022 17:00:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 17:00:41 2022
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,TO_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 49D2220400
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 16:43:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.719 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FREEMAIL_FORGED_FROMDOMAIN=0.249,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.228,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7IPHNsER5ubn for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 16:43:11 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pf1-f171.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0C0DD20639
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 16:29:35 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id z17so4594521pff.7
        for <nbd@other.debian.org>; Fri, 17 Jun 2022 09:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x3T4D+yOaq9lo8BU1AjLyhVwMBWPQQL/H4Z2pOmaK6c=;
        b=4bMsZxtToCNbozKodh7tDdGs26mEH6rz4MKFURAOaK67R92kmKu6DQoWAeZ2HEcj97
         0CGGuCxuug4Vz2dyCIrmwo264/tO9flh8W1P1R0TvA626ySxVUclvW7Q7ojQCDH8pAnM
         OPPgtCrxNJxMRYH5SbWD6eDZd4b9krKXOILXFjnE0smxJVPq9YzQcSr6Y7wAwhBBj0iN
         Ip6+RkDIqjMBXuYuBwjErS9mSWRY1yYFA/W9HR3/QhZZ0/KAwm/0TPs1FzHFLeYfaQpA
         9mLrW3thlIu1XHD8DG9l3D7grRz9IMtQFWqOdiJ5vqLKNKG4Kc3Nf+bLA+CGV/pGkeYx
         bZjQ==
X-Gm-Message-State: AJIora/qSnagd7fJ2UkNUVZpQU/fJhdpCooJbROxee2O4k/Kgf1XwczM
	xJxhw1QKRiG7qOcdjhD4OzI=
X-Google-Smtp-Source: AGRyM1stNp1gT9uJQRkH23ZVZcEfOLXxdhPmA8X/nMhdFsuF8GV3jpeyCFDLLrooGlCGjlATeQWtWg==
X-Received: by 2002:a05:6a02:201:b0:3fc:6071:a272 with SMTP id bh1-20020a056a02020100b003fc6071a272mr9888178pgb.518.1655483372280;
        Fri, 17 Jun 2022 09:29:32 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:5d24:3188:b21f:5671? ([2620:15c:211:201:5d24:3188:b21f:5671])
        by smtp.gmail.com with ESMTPSA id o2-20020a17090a168200b001e31c510f10sm5637387pja.54.2022.06.17.09.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 09:29:31 -0700 (PDT)
Message-ID: <6d84b3cb-a362-05ae-c7c3-62d3eddf9f02@acm.org>
Date: Fri, 17 Jun 2022 09:29:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/5] blk-mq: Drop blk_mq_ops.timeout 'reserved' arg
Content-Language: en-US
To: John Garry <john.garry@huawei.com>, axboe@kernel.dk,
 damien.lemoal@opensource.wdc.com, hch@lst.de, jejb@linux.ibm.com,
 martin.petersen@oracle.com, hare@suse.de, satishkh@cisco.com,
 sebaddel@cisco.com, kartilak@cisco.com
Cc: linux-rdma@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org
References: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
 <1655463320-241202-4-git-send-email-john.garry@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1655463320-241202-4-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FR-oCbGOGuN.A.FoH.5MLriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2154
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6d84b3cb-a362-05ae-c7c3-62d3eddf9f02@acm.org
Resent-Date: Fri, 17 Jun 2022 17:00:41 +0000 (UTC)

On 6/17/22 03:55, John Garry wrote:
> With new API blk_mq_is_reserved_rq() we can tell if a request is from
> the reserved pool, so stop passing 'reserved' arg. There is actually
> only a single user of that arg for all the callback implementations, which
> can use blk_mq_is_reserved_rq() instead.
> 
> This will also allow us to stop passing the same 'reserved' around the
> blk-mq iter functions next.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

