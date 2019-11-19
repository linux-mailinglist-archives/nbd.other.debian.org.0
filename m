Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C520102977
	for <lists+nbd@lfdr.de>; Tue, 19 Nov 2019 17:33:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EFC1B2089F; Tue, 19 Nov 2019 16:33:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 16:33:19 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D6F8220886
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2019 16:17:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KvHjlwfSSKsr for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2019 16:17:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x729.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 523A420894
	for <nbd@other.debian.org>; Tue, 19 Nov 2019 16:17:04 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id m16so18290581qki.11
        for <nbd@other.debian.org>; Tue, 19 Nov 2019 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZqRLNz3QoP7lC3GoX4dGbpM/0X+BMWIWcZVOVY7dcIU=;
        b=EEDZ6kzKJxHxR0jYrvurpFG7/VtWy3lmas2bKyDXg0ZIHpu7ZvgPRmxgNIdJ5Trl8o
         2i+mkawUu3GG/1fSr9nzBfLa1IwyzlN5vbaTmoKGke3iU9oK6RwfGr4wkUK2CcZ4XRS4
         T8m6NFVGWYmHUhSii2nMalguQ49rr8DmBIkT46n//mCXFsljMqZhQqpPqcvsVRXp5ZR8
         j3Yz/HgyL4AScR2b/nyEyR8AHVMVBqeRo3TLRgbr+kXQezQzjhiWi7JePw3i6rj+I7Kk
         fXVbFKoYoCJ9W+vXBQuspHHAYavKVmMHwyEXIdioL2V4cpezvpipuNysIJNNSxebF/rO
         m8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZqRLNz3QoP7lC3GoX4dGbpM/0X+BMWIWcZVOVY7dcIU=;
        b=h8Ix1Nk6K4RZqNRIk+zizCgb3o+T6TYkPtVlB3v1jDQHVaRkZb1wUYl8Z4LeKP0JMK
         AFOkI0xLoGXlHAY/SKhYvskbxjQjt2Ns41oGh9QBuwwacU8e4a0MpTPZzWLrvqufxDBh
         R0gglatMs5KEIWNbpw6sHm4U6eE21k1aF6Bp5v3aeadbdWb7Mrf5zcPIhhErInygLlwk
         S1WwpTmpY+5+IcClMU80goyQdBWir1xBnpGJMM910PAKTvove2lBofxcLuo9qCh5E2Cd
         oNMEEJCz94jPcvT7Dbr8gdH7s1kpb4/BvY69O5PlZSIGIphPOkyJtD3m5KHQJSE7YsWp
         qSeQ==
X-Gm-Message-State: APjAAAUl38lwSp6OWyW7ig0OgcqhFi85NfzFUC1efpA7ngFdGVXv9gm1
	42CIvY41W1YpA6IIKwl8kNJR/w==
X-Google-Smtp-Source: APXvYqw4sM1JFEaj5qBtyeVFL3GFBIz1nwvBoJWPMV830wZLNSSNqslB0uqWWe1hYNiEkrIrWvyc7Q==
X-Received: by 2002:a37:a70b:: with SMTP id q11mr30591722qke.350.1574180221163;
        Tue, 19 Nov 2019 08:17:01 -0800 (PST)
Received: from localhost ([2620:10d:c091:480::61cf])
        by smtp.gmail.com with ESMTPSA id b3sm9769407qkl.88.2019.11.19.08.16.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Nov 2019 08:17:00 -0800 (PST)
Date: Tue, 19 Nov 2019 11:16:58 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Sun Ke <sunke32@huawei.com>, josef@toxicpanda.com,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, Mike Christie <mchristi@redhat.com>
Subject: Re: [v2] nbd:fix memory leak in nbd_get_socket()
Message-ID: <20191119161658.mmifoeplc5vsdt64@macbook-pro-91.dhcp.thefacebook.com>
References: <1574143751-138680-1-git-send-email-sunke32@huawei.com>
 <d68d17be-0c4e-1286-4327-0e3ba6600eca@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d68d17be-0c4e-1286-4327-0e3ba6600eca@kernel.dk>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HKFMWY124bH.A.NcB.PlB1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/741
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191119161658.mmifoeplc5vsdt64@macbook-pro-91.dhcp.thefacebook.com
Resent-Date: Tue, 19 Nov 2019 16:33:19 +0000 (UTC)

On Tue, Nov 19, 2019 at 09:13:34AM -0700, Jens Axboe wrote:
> On 11/18/19 11:09 PM, Sun Ke wrote:
> > Before return NULL,put the sock first.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: cf1b2326b734 ("nbd: verify socket is supported during setup")
> > Signed-off-by: Sun Ke <sunke32@huawei.com>
> 
> Please always CC the author of the patch you're fixing.
> 
> Mike, Josef - we probably need to get this upstream ASAP.

Yup sorry got distracted,

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

