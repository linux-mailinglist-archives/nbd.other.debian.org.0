Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348165D41B
	for <lists+nbd@lfdr.de>; Wed,  4 Jan 2023 14:24:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9C2B22063E; Wed,  4 Jan 2023 13:24:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  4 13:24:11 2023
Old-Return-Path: <ketiaxbusux@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
	FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,UNDISC_FREEM
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 66D1E205F1
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Jan 2023 13:06:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.75 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	FREEMAIL_REPLYTO=1, FREEMAIL_REPLYTO_END_DIGIT=0.25,
	RCVD_IN_DNSWL_NONE=-0.0001, UNDISC_FREEM=2.699]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id br_A6FeLwrR0 for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Jan 2023 13:05:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-qk1-x72c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 83A0E205E9
	for <nbd@other.debian.org>; Wed,  4 Jan 2023 13:05:53 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id pj1so16229205qkn.3
        for <nbd@other.debian.org>; Wed, 04 Jan 2023 05:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=CvL+ep+/rtWoqemfxI7wMRAa6l5m75uCs0NkeX9c/LvgwQeBe2yteZ282qet7LqK3e
         HxG/Im0ZM/D1WODWOklWQLf7OSL2rnEYePbCC3kd5S7iXTIHk2TS9m4HXqg7X35SFalO
         la5iGs7bIa3/kTqN6sAmkNh0hoDLXQ/We3MdB2P1weN7ux+DF08kDg/6A/Y6YfgRBxcY
         KtDFS1uPETmKgl0qf8DjC302y7mP/AVrTIbIo86apj+J47m+1pZNy3GOJxen9dicVXiY
         BsuY33L2i2P2qgBdsZW4+/Yf2ArRdKBESHT+mFor1aYszrVEnphp0wzk59LkTEnCXMpY
         DxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=C7oFOjyDdXWFl2c/EI0eHREWoE7gr75oNcERZHdhlbprVR/zH46finMseNkqlOrxkS
         xirToU68D8aoPX19e/Y/dLeq8ctKi745Z7Ql+hrQHWGq8ZDwhVK+v5QfWkVp8WLsMGy9
         rrARnSde05XHellBwpQYlAxACYBuMolbIA9vpKemtzHRLLeLbi8UE+IHYWn58sCwuwu3
         YJWF2O2pn8EqSzpIn8pJgpDVSBx411Jnwyd24XARay8ZEv6P6fk3d3dAhPedY5xgONei
         BIsXU3q6CmTyNUFmTfEpy/Nn+Eotwbe2V1Lbwscu3ZYKGowa3Ei7AOAgM7yE4CwR1bhA
         +2yw==
X-Gm-Message-State: AFqh2kp/kr9nfVOdKmar7D3tsZrwJcuWPfhx7ctwar97WeO69TEbkkkR
	8CodO68SEwBbOzXYnnGK7VVNIp0Se76CyrktVY0=
X-Google-Smtp-Source: AMrXdXu2OgEBObdRdbMNu97JgXKPUIU/iPSgjknWbpkI9oHVVplu/0eITEKHSfy21FjM4TZO7YYYJ2NT+qIkDRPzmNA=
X-Received: by 2002:a05:620a:1327:b0:6ff:df2:2936 with SMTP id
 p7-20020a05620a132700b006ff0df22936mr1594016qkj.138.1672837550090; Wed, 04
 Jan 2023 05:05:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad4:574b:0:b0:531:bf92:424d with HTTP; Wed, 4 Jan 2023
 05:05:49 -0800 (PST)
Reply-To: Gregdenzell9@gmail.com
From: Greg Denzell <ketiaxbusux@gmail.com>
Date: Wed, 4 Jan 2023 13:05:49 +0000
Message-ID: <CAMG0K-Sr6UEGeS3F8yMsn1s0JW0MpyFf3Mbwf-181tMy0XDkMg@mail.gmail.com>
Subject: Seasons Greetings!
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <X60-Iv-0qmN.A.m7C.73XtjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2315
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMG0K-Sr6UEGeS3F8yMsn1s0JW0MpyFf3Mbwf-181tMy0XDkMg@mail.gmail.com
Resent-Date: Wed,  4 Jan 2023 13:24:11 +0000 (UTC)

Seasons Greetings!

This will remind you again that I have not yet received your reply to
my last message to you.

