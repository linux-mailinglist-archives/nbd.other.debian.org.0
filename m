Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 75468E5580
	for <lists+nbd@lfdr.de>; Fri, 25 Oct 2019 22:54:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 372A62047E; Fri, 25 Oct 2019 20:54:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 25 20:54:08 2019
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7B360205C4
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Oct 2019 20:37:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vX9O52CdnsHy for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Oct 2019 20:37:41 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x141.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 720BC205C1
	for <nbd@other.debian.org>; Fri, 25 Oct 2019 20:37:40 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id o16so2948456ilq.9
        for <nbd@other.debian.org>; Fri, 25 Oct 2019 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sFOHXijh8F7tyUILbQgSmtZ9TMRFJZXJfFdJlMEpFPw=;
        b=WNZinwbnHex8EMNtR8ji0Dh852Tlp8yGQIPZGwopQsOOv7S0K3a0x+aKXrHab/az0L
         CBXYM+H3I7QPFYpETwbLDWQdmPHvJSMkbJb2HyaZLXveRDOLU7v9AQwpVttKWxHnFEou
         ec+O8VyYRUb38iLmJFRX+0UWgJfiVYniIknFpN9v0N4/hx8euf5wzGm0u44wKiOnEOH5
         FYznj4oTzceVuPaPhehf/NfAUeSGngJVsLCe07hDCGDZ/ww5fWFZMDR6hqoVwaEUF6YQ
         esEoARTsvAPSdKKbURCN9uaHKiRX9sFkXwsRRIZ25UOoMVdkfzewXcU29RwhgN/nDpNM
         IsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sFOHXijh8F7tyUILbQgSmtZ9TMRFJZXJfFdJlMEpFPw=;
        b=aHoo23sm/4jaKKeFUSaK47BcCtGOTRo6LZGiaUfnjS7r4jNmWD1eXHU5yWQcvhIL3L
         4XhrycmHwDmLXFB6tQuS3VQGpnIwteY7XgcCawCnPDpAVo8oWoQ1rZ3/AuSvRDuJ1Ylk
         IsT0NxyW1Pxo2CwRSDQ4nlP+PH3KBFh4wES72RdWTqvRexv6WxmfDQxsTfrg8LdzOoKr
         ahNqkWgb9x8YUPx4QdON+Fl9zxyr0axBGigGSUvzukYzlwihMZopC9o+F0H73ZiAhzD9
         w1fLEt5N9jYEGa4ka1SikKIjnX94f5iOVrYK3zz/AeLH5JEh1+AxGNNzemQWmOdjPlec
         zN6g==
X-Gm-Message-State: APjAAAVctFXZ0xIWipfA5kv46t6tFLUKnR5QtfHyISizC0edpRrq5+mD
	JqKpZL1FiUjyDfd59Sr3W0kPaw==
X-Google-Smtp-Source: APXvYqxAb860qHVJ/S/BtDt5SCY75IP/zMUFwrG6/xVzIa7onloMW/63uMiyOEizoVxwCYerRRX52Q==
X-Received: by 2002:a92:17ce:: with SMTP id 75mr6369822ilx.88.1572035857658;
        Fri, 25 Oct 2019 13:37:37 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id 128sm348265iox.35.2019.10.25.13.37.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 13:37:36 -0700 (PDT)
Subject: Re: [PATCH] nbd: verify socket is supported during setup
To: Mike Christie <mchristi@redhat.com>, nbd@other.debian.org,
 rjones@redhat.com, ebiggers@kernel.org, josef@toxicpanda.com,
 linux-block@vger.kernel.org
Cc: syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com
References: <20191017212734.10778-1-mchristi@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <abf05db4-03ce-43a1-396c-a366b1d46451@kernel.dk>
Date: Fri, 25 Oct 2019 14:37:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017212734.10778-1-mchristi@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <f9BXCPaG4aK.A.YhC.wD2sdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/723
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/abf05db4-03ce-43a1-396c-a366b1d46451@kernel.dk
Resent-Date: Fri, 25 Oct 2019 20:54:08 +0000 (UTC)

On 10/17/19 3:27 PM, Mike Christie wrote:
> nbd requires socket families to support the shutdown method so the nbd
> recv workqueue can be woken up from its sock_recvmsg call. If the socket
> does not support the callout we will leave recv works running or get hangs
> later when the device or module is removed.
> 
> This adds a check during socket connection/reconnection to make sure the
> socket being passed in supports the needed callout.

Applied, thanks Mike.

-- 
Jens Axboe

