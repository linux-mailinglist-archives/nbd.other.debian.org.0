Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169954FBCC
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 19:00:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4C266203C7; Fri, 17 Jun 2022 17:00:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 17:00:20 2022
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
	by bendel.debian.org (Postfix) with ESMTP id BE95720455
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 16:43:11 +0000 (UTC)
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
	with ESMTP id seW_8tgE6vkL for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 16:42:59 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pj1-f48.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BD76420681
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 16:25:29 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id d14so1221668pjs.3
        for <nbd@other.debian.org>; Fri, 17 Jun 2022 09:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qffc/qF45xQUUVX0iLvakRS+0SCnFCY/1DsKCxCMUk4=;
        b=Ugr0Gns3xmqil8yjsboC+7sItQr7w+an7i0XA9mNtLcC/KW9OFipf4n5l7MJV6iV7i
         bi6qKkyB61hI00YzoGAKjA9CgQUeN3VeO0UzCptLbTu93Y790UmQEq7Xmpq5CY0WDkt8
         dj7yVH3MhSgMuKpepTGrDAUR8t/tA8wQEO+ObMrIahN2WGEvGpRbnnyoTg/fT95s8a4O
         l8mjuc4AyZ8ZiiNyZbZ2F9szFsPEgRlCBKexrl095WSTbO8PaZam/eicbjYgCx8XqN84
         8CNVyciG7Su4lE2O5AnK3d8Z+B79yWrMsr5vi1KWQKRF05JsU5LsINKuq91paW8yQThw
         np1g==
X-Gm-Message-State: AJIora+/bMpfTbOua/qgMkf8njPdG3mF4P/z+HBMx7mHLFOJX4Cl6Xz9
	JZgzHPzUt3RdHu04CpEOI1s=
X-Google-Smtp-Source: AGRyM1v0wKaWpD+fRkQWYGcTmSFjnZvqVDvDVjWy1Fw5laZHlNFrGY0kvjKc1A9gYn6s9UIarDHnZg==
X-Received: by 2002:a17:90b:1b49:b0:1e6:a23:69c6 with SMTP id nv9-20020a17090b1b4900b001e60a2369c6mr11379208pjb.124.1655483125778;
        Fri, 17 Jun 2022 09:25:25 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:5d24:3188:b21f:5671? ([2620:15c:211:201:5d24:3188:b21f:5671])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902680300b001637529493esm3804323plk.66.2022.06.17.09.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 09:25:24 -0700 (PDT)
Message-ID: <f559b5d3-cba4-4dff-7db0-5dc24b4078b8@acm.org>
Date: Fri, 17 Jun 2022 09:25:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/5] scsi: core: Remove reserved request time-out handling
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
 <1655463320-241202-2-git-send-email-john.garry@huawei.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1655463320-241202-2-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-NVNCtYRBDJ.A.TjH.kMLriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2153
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f559b5d3-cba4-4dff-7db0-5dc24b4078b8@acm.org
Resent-Date: Fri, 17 Jun 2022 17:00:20 +0000 (UTC)

On 6/17/22 03:55, John Garry wrote:
> The SCSI code does not currently support reserved commands. As such,
> requests which time-out would never be reserved, and scsi_timeout()
> 'reserved' arg should never be set.
> 
> Remove handling for reserved requests and drop wrapper scsi_timeout() as
> it now just calls scsi_times_out() always.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

