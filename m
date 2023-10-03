Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E558E7B72E7
	for <lists+nbd@lfdr.de>; Tue,  3 Oct 2023 22:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C8742206FE; Tue,  3 Oct 2023 20:57:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct  3 20:57:12 2023
Old-Return-Path: <samuel.holland@sifive.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C12E206C3
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Oct 2023 20:40:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id spjQU2WI4x0x for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Oct 2023 20:40:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .sifive. - helo: .mail-qk1-x735.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DB07220647
	for <nbd@other.debian.org>; Tue,  3 Oct 2023 20:40:14 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7742be66bd3so97952785a.3
        for <nbd@other.debian.org>; Tue, 03 Oct 2023 13:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1696365611; x=1696970411; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Nxvc1lxZifVSA6lTiXigXFomqQxRhSDegObkyWLMxc=;
        b=hjMgx5bBx/WGrjImW8kWf3lNWnUa3xGiUSFF3eZiW2IHT0m8sXKr+y/IVkbpZDB2ya
         DlLg1N1OnM85md+Ae+KcPL9msOmSzPsK8OQqi8/sMTDrROHIMU7O+bTGoEqlnUMafVNO
         QCd2NLC8LCowzbQQ+mWx24P/6HVYQc58GOp9r0FSiG3OrcAP/PiycSXnQqbHyTO+dH+0
         hCn0A0dqgQWAg9L/KdlKApbZjn91q0/vh69v1fWZlGXj6+bbSAXNCskhWd9guBIkgOIv
         Ao8TzS+8jNKVM363cLG6ZYdbxhTf40RjYIsfNB53t12S+GxVxIctkhwb3x16RjEiNPvR
         edDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696365611; x=1696970411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Nxvc1lxZifVSA6lTiXigXFomqQxRhSDegObkyWLMxc=;
        b=cpKWenPhHtvLs5eHzmKgyA6AT5yphukBM6m93JGmDrE2pNLl59rVUlin3QmsScUdIV
         CSSBFbG7UYK7NWdv0f/bOB/d3fja/e32BWEIkB26LYsVPIPGKveWEOxL0miV8W04VsQ3
         ltROjGRmPwkRcjS1cEqo/v4dhmiXBcGCS4mtNaToF5stJAzHQbwGDbHMyavAOVnw2sFb
         crhSLPMB3DMoJ4tmq36xsHQ/biAwtHXP6VTiDPO2Qh5KVHhdY6OZA6URPdsEtIFQ6hGK
         k4hQcPClxGK6Rlmbv8U4sRpw7YB4Ew3GEGgaB5jWFWN1+yrmvfdFFFXDLNVyG10e1G3Y
         IUXA==
X-Gm-Message-State: AOJu0YwwSSpBwzpaafcwzz+md60ltXcPNM379oZO8OwlehwBDdzMq0xw
	32Kdo+o32SFUtoAvB+a6uLJuSQ==
X-Google-Smtp-Source: AGHT+IERa23rjiYbZGQ+VUfAQarw40/LaUs9xATjvyAOXV8DcAZ8vcJgSFIsCAlJosNJWZgZwYsztg==
X-Received: by 2002:ae9:f401:0:b0:76c:9ac2:3f22 with SMTP id y1-20020ae9f401000000b0076c9ac23f22mr678434qkl.68.1696365611293;
        Tue, 03 Oct 2023 13:40:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:6022:6438:e898:6c27? ([2600:1700:2000:b002:6022:6438:e898:6c27])
        by smtp.gmail.com with ESMTPSA id g4-20020ae9e104000000b007743360b3fasm753508qkm.34.2023.10.03.13.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 13:40:10 -0700 (PDT)
Message-ID: <1ded0a2d-3fc7-4268-870c-a315ba3b6232@sifive.com>
Date: Tue, 3 Oct 2023 15:40:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: don't call blk_mark_disk_dead nbd_clear_sock_ioctl
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, josef@toxicpanda.com, axboe@kernel.dk
Cc: w@uter.be, linux-block@vger.kernel.org, nbd@other.debian.org,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20231003153106.1331363-1-hch@lst.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231003153106.1331363-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Jfqw3l2ol3N.A.atF.oAIHlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2658
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1ded0a2d-3fc7-4268-870c-a315ba3b6232@sifive.com
Resent-Date: Tue,  3 Oct 2023 20:57:12 +0000 (UTC)

On 2023-10-03 10:31 AM, Christoph Hellwig wrote:
> blk_mark_disk_dead is the proper interface to shut down a block
> device, but it also makes the disk unusable forever.
> 
> nbd_clear_sock_ioctl on the other hand wants to shut down the file
> system, but allow the block device to be used again when when connected
> to another socket.  Switch nbd to use disk_force_media_change and
> nbd_bdev_reset to go back to a behavior of the old __invalidate_device
> call, with the added benefit of incrementing the device generation
> as there is no guarantee the old content comes back when the device
> is reconnected.
> 
> Reported-by: Samuel Holland <samuel.holland@sifive.com>
> Reported-by: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Fixes: 0c1c9a27ce90 ("nbd: call blk_mark_disk_dead in nbd_clear_sock_ioctl")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/nbd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Tested-by: Samuel Holland <samuel.holland@sifive.com>

Thanks for the fix!

