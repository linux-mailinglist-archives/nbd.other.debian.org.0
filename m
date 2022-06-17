Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1154FBCF
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 19:00:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6F0C4203E7; Fri, 17 Jun 2022 17:00:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 17:00:52 2022
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=FOURLA,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,TO_TOO_MANY,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 11B9D20455
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 16:43:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.616 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.228,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id azBQ6LkB2xZw for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 16:43:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pj1-f52.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7297420683
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 16:30:01 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso4634011pjk.0
        for <nbd@other.debian.org>; Fri, 17 Jun 2022 09:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1CdPsYcJMiRyRao0OFv69oSt2+3EiKlT7x2/BM9HIJY=;
        b=ItSIOxsuTHNCxp0jHHWagMYrjWqHM+nw0GpwnHBVdOwyC6f46MCiGWo/b+L6XmoFpH
         aXYyX2xp94lhACOFWMowwv+O3fs5UuNG2MRxO+fexZ+IczV5q75dsIi8ACbTo/FPf4rC
         vtxcVGk1JzcCDaZBRCTuJHMfWv5YyhLAXLcLwVVYNq1D3Kat46cEiz3X/eV2EtuBYkcO
         qaS68zVBxiGTZLL1BsDMOiwaybl5/3nj9EH5K/YKRg5+bTvAJUSbrdVSvZrvd5Hg8R2W
         fYN2Y2y0tL7pTxh1K/OB20jMYB9QchlKJ36eIy+SgkNe/QiOMbmVaZJFvmzQg45Xk+Ba
         QOyg==
X-Gm-Message-State: AJIora+wEZYl/bSdSwdljm3l0A8EkOJrPUpze1XsHtJctFtv/N29NOCJ
	2rovn8Val5nI9Sg39mBc7BQ=
X-Google-Smtp-Source: AGRyM1t/wDXMzo+bOEkKIQH/k9xjz21/990h5UWigbcfj8KAhJoJx1iRoTgXlJGSllOagISeEk0Fkg==
X-Received: by 2002:a17:90a:6444:b0:1ea:b662:c12e with SMTP id y4-20020a17090a644400b001eab662c12emr11580102pjm.199.1655483397636;
        Fri, 17 Jun 2022 09:29:57 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:5d24:3188:b21f:5671? ([2620:15c:211:201:5d24:3188:b21f:5671])
        by smtp.gmail.com with ESMTPSA id jb11-20020a170903258b00b0015e8d4eb25bsm3756460plb.165.2022.06.17.09.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 09:29:56 -0700 (PDT)
Message-ID: <336492df-d74d-9eb9-4b51-d6d1f915493a@acm.org>
Date: Fri, 17 Jun 2022 09:29:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/5] scsi: fnic: Drop reserved request handling
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
 <1655463320-241202-5-git-send-email-john.garry@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1655463320-241202-5-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Mvsvv3bmOAJ.A.sqH.ENLriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2155
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/336492df-d74d-9eb9-4b51-d6d1f915493a@acm.org
Resent-Date: Fri, 17 Jun 2022 17:00:52 +0000 (UTC)

On 6/17/22 03:55, John Garry wrote:
> The SCSI core code does not support reserved requests, so drop the
> handling in fnic_pending_aborts_iter().

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

