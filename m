Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 711F7528445
	for <lists+nbd@lfdr.de>; Mon, 16 May 2022 14:36:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 44DA2203C3; Mon, 16 May 2022 12:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 16 12:36:09 2022
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 92BDC20351
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 May 2022 12:20:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VFviitbFg7wm for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 May 2022 12:20:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pf1-x433.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CCA86203D0
	for <nbd@other.debian.org>; Mon, 16 May 2022 12:20:29 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id y41so13840340pfw.12
        for <nbd@other.debian.org>; Mon, 16 May 2022 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=KiHgPRQNMM51hvm96SqNj33U6OXbW6qZzYEx0pv+WEQ=;
        b=lgPqdq84TcmO/n5+xA+cuAOzIElmdxREfkewtW2D0BhxlqDQWSnsf07w8aekQ7VCms
         RuHnLDvLLF1cuVxcGaHsMiuLDWim3UtCkMc4xGy4ByFcMabhhNXZhrqG0IgoaxXq39uF
         spbM9UuoAD1m0+lCH/zC7Mci5QNuuQbe6QdQfuAZVCruHw7KFA6RlQOLPB6+/qzRC7oJ
         hyZiqOo3hYBEU2aU5VHCXGZSiWjPza304U1dlpJqKGfjrrW6QUIDHzlaXuI0bNthUImY
         R/AarvweTj1NVetd3vgMA9he1qEY69zcAVjoINB+7R0E0WE4RTj911w74WYrMv+gZ84j
         F/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=KiHgPRQNMM51hvm96SqNj33U6OXbW6qZzYEx0pv+WEQ=;
        b=VVH/led8WtLCriJUkYIETZDTk1kT1y54tIC0M2Y4AzLp6fXyX2yR9KAMPMNQqWPXUT
         +J+6Oaq/+UahL3NtEHzVwzX0yyBXEvtJgCrHzEcKQmf4GlsfHlxr4fVbN4JQfEA6mNP+
         u5eEdb+3fsIPjH39K+xK7Z6JmFqFzFEX7rlo/CqS1JMJZLZRNYhfTYVedw6Uqxxa5Bkn
         fCAs5pJp2I4SHnJ1/JgsWKZjt25rS1/zqCMwb3j7jbqnUDyu9yCZ7jeyotuJ6rBeP/LU
         2467zGDzHYpRoHJJdHX3ZNnRCs0w7ERDPH/Kys1IHX0mqPu+0I2mGtJAWhSGmQYY+QFg
         Uggw==
X-Gm-Message-State: AOAM530uSzCKEA0wYtJxNd0iBXL8iyll06nV50X8TlpcxsLXd8woow7A
	KytBZS0XWeU1Ay3H9vOFgJtojg==
X-Google-Smtp-Source: ABdhPJzfMPeDythetyHLEbcX8r99P4NlIIOCE7Gh+INnjSrFzi9IWiEZ+HhqI8NeeOl9CLyLf+qg9Q==
X-Received: by 2002:a05:6a00:cc4:b0:50d:e9db:6145 with SMTP id b4-20020a056a000cc400b0050de9db6145mr17232353pfv.56.1652703625903;
        Mon, 16 May 2022 05:20:25 -0700 (PDT)
Received: from [127.0.1.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id z21-20020aa785d5000000b0050dc76281c8sm6811476pfn.162.2022.05.16.05.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 05:20:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: xieyongji@bytedance.com, josef@toxicpanda.com
Cc: nbd@other.debian.org, zero.xu@bytedance.com, linux-block@vger.kernel.org
In-Reply-To: <20220322080639.142-1-xieyongji@bytedance.com>
References: <20220322080639.142-1-xieyongji@bytedance.com>
Subject: Re: [PATCH] nbd: Fix hung on disconnect request if socket is closed before
Message-Id: <165270362494.10115.13881054748910771179.b4-ty@kernel.dk>
Date: Mon, 16 May 2022 06:20:24 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wGgKpBXAorM.A.im.5UkgiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2074
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/165270362494.10115.13881054748910771179.b4-ty@kernel.dk
Resent-Date: Mon, 16 May 2022 12:36:09 +0000 (UTC)

On Tue, 22 Mar 2022 16:06:39 +0800, Xie Yongji wrote:
> When userspace closes the socket before sending a disconnect
> request, the following I/O requests will be blocked in
> wait_for_reconnect() until dead timeout. This will cause the
> following disconnect request also hung on blk_mq_quiesce_queue().
> That means we have no way to disconnect a nbd device if there
> are some I/O requests waiting for reconnecting until dead timeout.
> It's not expected. So let's wake up the thread waiting for
> reconnecting directly when a disconnect request is sent.
> 
> [...]

Applied, thanks!

[1/1] nbd: Fix hung on disconnect request if socket is closed before
      commit: 491bf8f236fdeec698fa6744993f1ecf3fafd1a5

Best regards,
-- 
Jens Axboe


