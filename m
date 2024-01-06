Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D7825DBC
	for <lists+nbd@lfdr.de>; Sat,  6 Jan 2024 02:51:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F356C20A0C; Sat,  6 Jan 2024 01:51:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jan  6 01:51:11 2024
Old-Return-Path: <senozhatsky@chromium.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7C94820833
	for <lists-other-nbd@bendel.debian.org>; Sat,  6 Jan 2024 01:33:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.023 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.066,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FSL_HELO_FAKE=1.199,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PWwYRDKOEVg0 for <lists-other-nbd@bendel.debian.org>;
	Sat,  6 Jan 2024 01:33:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .chromium. - helo: .mail-il1-x136.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 626992098E
	for <nbd@other.debian.org>; Sat,  6 Jan 2024 01:33:03 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3606ebda57cso1012565ab.2
        for <nbd@other.debian.org>; Fri, 05 Jan 2024 17:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704504780; x=1705109580; darn=other.debian.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qT3oZQlZSl6Q++CcuktscPeZvw2bExX2KYu8x/389yU=;
        b=jOvQ5TBuwza1A6J5pruXua7oMyRijG4jpFOvczPzAm6UIu6RGK19zdom6VxU3S4S3d
         rtjvlN1GxlW/gEtUNIZt+vp3PS9jpYFJ5hxksPuIw4d1sVC9NiuMliMPhMsShRxz6OAw
         xPg+UI/FNNlbs9s3h3NNcsW4LiFh5hqYkXyj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704504780; x=1705109580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT3oZQlZSl6Q++CcuktscPeZvw2bExX2KYu8x/389yU=;
        b=kvQO6/xoeg/5Xd6/QsLrsiEvmGeQ51WYTGbJSlMIRXf5X3+3RUj3l6iSvb4zwjETJ2
         SaHAwBDtEo1uHw63x5P88+su86MB/4r914eaUCPZUuqakhVsLRY30QHJuZW5PMiMylhC
         I5Qj+uGF3qYzd/UxuOHgBJT9NCltwFRX/cU5ojtsmK6ATmm0HOuZJGLxGxaCasvZ6612
         Q8lra2BGUjmkTntw6g3/uK96UjxABku2AADOD/8hVCZXYtecHlg6LkDVjcJeUdmoGx+0
         VWgi9Tqag8sLdarx7ixg1amypGZBMjU5mithHGofb603YPNdJx/W+CY/PQh/Mpv7QeMo
         qBrg==
X-Gm-Message-State: AOJu0Yw/jnJK1cos5LyD0DFZcS+TdIF6MpNt07wn8MntsT6hXlnfjm5p
	5PEqKRieFUv/+sKPGP0zUlXb8o+WX/4F
X-Google-Smtp-Source: AGHT+IGbdqkCX01n0F2LxOJc20c51ndSlx6/hfXSdI3NKdAsCGkhvdsG05i+OtNt2Y/UCPH6C9phNg==
X-Received: by 2002:a05:6e02:1c0b:b0:35d:62f2:1f45 with SMTP id l11-20020a056e021c0b00b0035d62f21f45mr533250ilh.20.1704504780792;
        Fri, 05 Jan 2024 17:33:00 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id y17-20020a170902b49100b001cf511aa772sm2017224plr.145.2024.01.05.17.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 17:33:00 -0800 (PST)
Date: Sat, 6 Jan 2024 10:32:54 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 7/9] zram: use the default discard granularity
Message-ID: <20240106013254.GC123449@google.com>
References: <20231228075545.362768-1-hch@lst.de>
 <20231228075545.362768-8-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231228075545.362768-8-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KKb8f9gy9SO.A.K6E.PILmlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2707
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240106013254.GC123449@google.com
Resent-Date: Sat,  6 Jan 2024 01:51:11 +0000 (UTC)

On (23/12/28 07:55), Christoph Hellwig wrote:
> 
> The discard granularity now defaults to a single sector, so don't set
> that value explicitly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

