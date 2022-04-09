Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B21044FA602
	for <lists+nbd@lfdr.de>; Sat,  9 Apr 2022 10:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A96F203DC; Sat,  9 Apr 2022 08:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Apr  9 08:33:09 2022
Old-Return-Path: <christoph.boehmwalder@linbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AEFE22042F
	for <lists-other-nbd@bendel.debian.org>; Sat,  9 Apr 2022 08:15:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.009 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SOH78SLl0nII for <lists-other-nbd@bendel.debian.org>;
	Sat,  9 Apr 2022 08:15:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linbit. - helo: .mail-wr1-x436.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6FCD42042B
	for <nbd@other.debian.org>; Sat,  9 Apr 2022 08:15:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i20so2930455wrb.13
        for <nbd@other.debian.org>; Sat, 09 Apr 2022 01:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sw+fQbvS6SFTnotjqrxbhqCVHIPsenv7yxMzOYGId1I=;
        b=swx5mkkbJNix1TPl46oJjK+Fw0+J2z/XHhCyUPh+dcKkTNBekj88xkgZeDCIEgfzZd
         +FA0t7ckuNM4K4OwCilxgo/M+WNIfDm8hTC88nPXmxm39Wp7Y3PlmqfYEyysUU8hQUUf
         QcFmQYaxbOUrhMO1omCXZ8F/Rog5zixS+JPWEUQR0KkNkX4orlWG0JIiavrTh9qI4888
         PfuJYdextltFDNT3Q+47ZPQuPkokUbAa0jhifptu2z1GSQMaUF7eHMsw0ukFDymbedqA
         fJT7coHgReWy+GC/y+kW2UJS/DziuPPZTxFTP9KzlhdtF9p6DIhUJyZVoMiIdhtFkJM+
         cESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sw+fQbvS6SFTnotjqrxbhqCVHIPsenv7yxMzOYGId1I=;
        b=Opx5MlCVoHxsjRRAIrki0W/SzMXVqCUDkKpwLF8jJN8SSCEs+pQ4+BcC/pKDfKRFU8
         Q0Fvel3GXOn4NtJxkDzJjda9zIUjP6zsr0P7uy4Fjx20RtiIhxtsRbT+lFHS2sbEt4tE
         7A1P0GXNbl4C0nwsIcTikhZBcRuwFM+SAd9hWrI/PvJRnDTMDB6ucmcOtBURO66UtIGR
         MeL4xAYYO5kahGJVh9dysYemaI5yCAZ2jr+G2pogXi0ptmFp/FPHpWCdXOeP8ecfQdjo
         myihzvI8GH2PYxf+ah6ZdTiplRSAg0TTtdzkKT0ymLI/BxmbXyoPpziImejG7FPaZomE
         gvnQ==
X-Gm-Message-State: AOAM532LxMytHkCmZ4OZG+TuZBa1xk9rPWkPBFVnEc01ixhCcQyD+9q1
	kxpMTCu5NsM/bn6ikkypUaNYyw==
X-Google-Smtp-Source: ABdhPJzQQyyFsXyXf3Tt03078VjcrkSv2k98fwj9oToPATRHlAVDyH773lIm4bEik17KjObuot5lIg==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id r11-20020a5d6c6b000000b001ea77eadde8mr17920640wrz.690.1649492137216;
        Sat, 09 Apr 2022 01:15:37 -0700 (PDT)
Received: from [192.168.169.127] (178.115.52.210.wireless.dyn.drei.com. [178.115.52.210])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0038b5162260csm16809052wmq.23.2022.04.09.01.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 01:15:36 -0700 (PDT)
Message-ID: <72e9bd34-3380-e305-65f0-a17306f5bd08@linbit.com>
Date: Sat, 9 Apr 2022 10:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Jens Axboe <axboe@kernel.dk>, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, Coly Li <colyli@suse.de>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-25-hch@lst.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MiN0RlTOj7P.A.FDD.FTUUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1961
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/72e9bd34-3380-e305-65f0-a17306f5bd08@linbit.com
Resent-Date: Sat,  9 Apr 2022 08:33:09 +0000 (UTC)

On 09.04.22 06:50, Christoph Hellwig wrote:
> Just use a non-zero max_discard_sectors as an indicator for discard
> support, similar to what is done for write zeroes.
> 
> The only places where needs special attention is the RAID5 driver,
> which must clear discard support for security reasons by default,
> even if the default stacking rules would allow for it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [btrfs]

I think you may have a typo there: my ACK was for drbd, not btrfs.

> Acked-by: Coly Li <colyli@suse.de> [bcache]
> ---
>   arch/um/drivers/ubd_kern.c          |  2 --
>   block/blk-core.c                    |  2 +-

